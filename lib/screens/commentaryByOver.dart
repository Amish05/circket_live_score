import 'package:flutter/material.dart';

class CommentaryByOver extends StatefulWidget {
  const CommentaryByOver({super.key});

  @override
  State<CommentaryByOver> createState() => _CommentaryByOverState();
}

class _CommentaryByOverState extends State<CommentaryByOver> {
  _CommentaryByOverState();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 57, 65, 114), width: 1.5),
                ),
              ),
              child: Container(
                height: 60,
                margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                color: Colors.white,
                padding: const EdgeInsets.all(3.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "2.1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                            "List (known as an array in some languages); is the array, or ordered (known as an array in some languages);",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
