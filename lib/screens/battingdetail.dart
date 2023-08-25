import 'package:flutter/material.dart';

class BattingDetail extends StatefulWidget {
  const BattingDetail({super.key});

  @override
  State<BattingDetail> createState() => _BattingDetailState();
}

class _BattingDetailState extends State<BattingDetail> {
  _BattingDetailState();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: ListView.builder(
          itemCount: 11,
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
                height: 40,
                margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                color: Colors.white,
                padding: const EdgeInsets.all(3.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Player Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
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
