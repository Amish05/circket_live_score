import 'dart:convert';

import 'package:circket_live_score/screens/Commentary.dart';
import 'package:circket_live_score/screens/scorecard.dart';
import 'package:flutter/material.dart';

List<dynamic> matchinfo = [];

Future<List<MatchModel>> fetchmatch({required id}) async {
  String apiUrl =
      'https://api.cricapi.com/v1/match_scorecard?apikey=fed7b56b-e98c-48a8-9d6c-ffe06e8a82e7&id=$id';

  var http;
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final matchinfoJson = data['data'] as List<dynamic>;
    return matchinfoJson
        .map((matchJson) => MatchModel.fromJson(matchJson))
        .toList();
  } else {
    throw Exception('Failed to fetch match');
  }
}

class MatchDetial extends StatefulWidget {
  String id;
  String? team1;
  String? team2;
  MatchDetial(this.id, this.team1, this.team2, {Key? key}) : super(key: key);

  @override
  State<MatchDetial> createState() => _MatchDetialState();
}

class _MatchDetialState extends State<MatchDetial>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    fetchmatch(id: widget.id).then((result) {
      // ignore: unnecessary_null_comparison
      if (result != null) {
        setState(() {
          matchinfo = result;
        });
      } else {
        // Handle the error condition, such as showing an error message
      }
    }).catchError((error) {
      // Handle any error that occurs during the API request
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  List<MatchModel> matchinfo = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 75, 36, 99),
        appBar: AppBar(
          centerTitle: true,
          title: Text("${widget.team1} VS ${widget.team2}",
              style: const TextStyle(
                  fontFamily: 'IrishGrover',
                  fontSize: 18,
                  color: Colors.white)),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(255, 68, 45, 104),
                    Color.fromARGB(255, 72, 30, 97),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.7, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Commentary',
              ),
              Tab(
                text: 'Scorecard',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            const Center(
              child: Commentary(),
            ),
            Center(
              child: ScoreCard(
                id: widget.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchModel {
  final List teaminfo;
  final bool matchStarted;
  final String id;
  MatchModel(
      {required this.teaminfo, required this.matchStarted, required this.id});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
        teaminfo: json['teamInfo'],
        matchStarted: json['matchStarted'],
        id: json['id']);
  }
}
