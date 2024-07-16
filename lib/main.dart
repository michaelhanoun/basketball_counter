import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<_TeamState> _teamAKey = GlobalKey<_TeamState>();

  final GlobalKey<_TeamState> _teamBKey = GlobalKey<_TeamState>();

  @override
  Widget build(BuildContext context) {
    Team teamA = Team(key: _teamAKey, teamName: "Team A");
    Team teamB = Team(key: _teamBKey, teamName: "Team B");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text(
              "Point Counter",
              style: TextStyle(color: Colors.white),
            )),
        body: Column(
          children: [
            const SizedBox(height: 32,),
            SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: teamA),
                  const VerticalDivider(
                    indent: 20,
                    endIndent: 40,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(child: teamB)
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
                name: "Reset",
                add: () {
                  _teamAKey.currentState?.reset();
                  _teamBKey.currentState?.reset();
                }),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class Team extends StatefulWidget {
  final String teamName;

  const Team({super.key, required this.teamName});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  int point = 0;
  void reset() {
    setState(() {
      point = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.teamName,
          style: const TextStyle(fontSize: 42),
        ),
        Text(
          "$point",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 150),
        ),
        CustomButton(
            name: "Add 1 point",
            add: () {
              setState(() {
                point++;
              });
            }),
        CustomButton(
            name: "Add 2 point",
            add: () {
              setState(() {
                point += 2;
              });
            }),
        CustomButton(
            name: "Add 3 point",
            add: () {
              setState(() {
                point += 3;
              });
            })
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final Function() add;
  const CustomButton({super.key, required this.name, required this.add});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
          onPressed: add,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              minimumSize: const Size(150, 50)),
          child: Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )),
    );
  }
}
