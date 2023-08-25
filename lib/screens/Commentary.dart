import 'package:flutter/material.dart';

import 'commentaryByOver.dart';

class Commentary extends StatefulWidget {
  const Commentary({super.key});

  @override
  State<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/images/pakistan.png",
                      width: 25,
                      height: 25,
                    ),
                    const Text(" teamA"),
                  ],
                ),
              ),
              Image.asset("assets/images/exchange.png"),
              SizedBox(
                child: Row(
                  children: [
                    const Text("teamB "),
                    Image.network(
                      "assets/images/england.png",
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 57, 65, 114),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Team B",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "250/8 (20)  ",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          color: Colors.white,
          padding: const EdgeInsets.all(10.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                "Overs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const CommentaryByOver(),
      ],
    );
  }
}
