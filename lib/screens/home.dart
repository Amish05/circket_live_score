import 'dart:js_interop';

import 'package:circket_live_score/screens/dailog.dart';
import 'package:circket_live_score/screens/matchdetial.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> matches = [];

Future<List<MatchModel>> fetchMatches() async {
  const apiUrl =
      'https://api.cricapi.com/v1/currentMatches?apikey=fed7b56b-e98c-48a8-9d6c-ffe06e8a82e7&offset=0';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final matchesJson = data['data'] as List<dynamic>;
    return matchesJson
        .map((matchJson) => MatchModel.fromJson(matchJson))
        .toList();
  } else {
    throw Exception('Failed to fetch matches');
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Cricket  Live";

    return MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle,
                style: TextStyle(fontFamily: 'IrishGrover', fontSize: 48)),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 45, 72, 95),
                      Color.fromARGB(255, 51, 144, 207),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.7, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
          ),
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 91, 174, 220),
                  Color.fromARGB(255, 4, 82, 146),
                ],
              )),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_image.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                child: const MatchesScreen(),
              )),
        ));
  }
}

class Matchscard extends StatelessWidget {
  Matchscard({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 160,
      child: GestureDetector(
        onTap: () {
          if (match.matchStarted == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MatchDetial(
                        match.id,
                        match.teaminfo![0]["name"],
                        match.teaminfo![1]["name"],
                      )),
            );
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const DialogBox();
                });
          }
        },
        child: Card(
          color: const Color.fromARGB(199, 32, 52, 91),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 2),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              match.teaminfo![0].containsKey('shortname')
                                  ? match.teaminfo![0]["shortname"]
                                  : match.teaminfo![0]["name"],
                              //"team 1",
                              style: const TextStyle(
                                fontFamily: 'JejuHallasan',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  " VS ",
                  style: TextStyle(
                    fontFamily: 'JejuHallasan',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      match.teaminfo![1].containsKey('shortname')
                          ? match.teaminfo![1]["shortname"]
                          : match.teaminfo![1]["name"],
                      //"team 2",
                      style: const TextStyle(
                        fontFamily: 'JejuHallasan',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<MatchModel> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches().then((result) {
      // ignore: unnecessary_null_comparison
      if (result != null) {
        setState(() {
          matches = result;
        });
      } else {
        // Handle the error condition, such as showing an error message
      }
    }).catchError((error) {
      // Handle any error that occurs during the API request
    });
  }

  @override
  Widget build(BuildContext context) {
    if (matches.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(matches.length, (index) {
          //final match = matches[index];
          return Center(
            child: Matchscard(match: matches[index]),
          );
        }),
      );
    }
  }
}

class MatchModel {
  final List? teaminfo;
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
