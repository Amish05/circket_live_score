import 'dart:convert';
import 'dart:js_interop';
import 'package:circket_live_score/jsonModels/matchinfo.dart';
import 'package:circket_live_score/screens/battingdetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Data> match = [];

Future<List<Data>> fetchmatch({required id}) async {
  String apiUrl =
      // 'https://api.cricapi.com/v1/match_scorecard?apikey=fed7b56b-e98c-48a8-9d6c-ffe06e8a82e7&id=$id';
      'https://api.cricapi.com/v1/match_info?apikey=fed7b56b-e98c-48a8-9d6c-ffe06e8a82e7&id=$id';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    match.add(Data.fromJson(data['data']));
    return match;
  } else {
    throw Exception('Failed to fetch matches');
  }
}

class ScoreCard extends StatefulWidget {
  final String id;

  const ScoreCard({required this.id, Key? key}) : super(key: key);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late Future<List<Data>> _matchFuture;

  @override
  void initState() {
    super.initState();
    _matchFuture = fetchmatch(id: widget.id);
    if (_matchFuture.isNull) {
      // print("no match values");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: _matchFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
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
                          Image.network(
                            match[0].teamInfo![0].img ??
                                "assets/images/exchange.png",
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            match[0].teamInfo![0].shortname ??
                                match[0].teamInfo![0].name ??
                                "Team 1",
                          )
                        ],
                      ),
                    ),
                    Image.asset("assets/images/exchange.png"),
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                            match[0].teamInfo![1].shortname ??
                                match[0].teamInfo![1].name ??
                                "Team 2",
                          ),
                          Image.network(
                            match[0].teamInfo![1].img ??
                                "assets/images/exchange.png",
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
                        ' team',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
//"${Data[0].score[0]['r']}/${Data[0].score[0]['w']} (${Data[0].score[0]['o']})",
                        "0 0 0 0 ",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Batter",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("R",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("B",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("4s",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("6s",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("SR",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const BattingDetail(),
            ],
          );
        }
      },
    );
  }
}
