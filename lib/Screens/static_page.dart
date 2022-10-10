import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:webapp/Widgets/add_to_cart.dart';

import '../Utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      foodCard(dataList[index], constraints, context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: dataList.length);
            }
            return SizedBox(
              width: 450,
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      foodCard(dataList[index], constraints, context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: dataList.length),
            );
          }),
        ));
  }

  Widget foodCard(Map data, BoxConstraints constraints, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: constraints.maxWidth < 500
              ? MediaQuery.of(context).size.width * 0.5
              : 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.adjust_rounded,
                color: Colors.green,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data["name"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data["price"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 4.2,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: Colors.grey.shade400,
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  const Text(
                    "4.2 ",
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text(
                    data["reviews"],
                    style: TextStyle(color: Colors.grey.shade600),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: data["description"],
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const TextSpan(
                    text: " more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ]))
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 170,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.black12)
                    ],
                    image: DecorationImage(
                        image: NetworkImage(data["image"]), fit: BoxFit.cover)),
              ),
              const Positioned(bottom: 5, child: AddToCart())
            ],
          ),
        )
      ],
    );
  }
}
