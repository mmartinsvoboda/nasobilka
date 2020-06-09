import 'package:flutter/material.dart';
import 'package:nasobilka/Pages/mathPage.dart';
import 'package:nasobilka/Services/gameManager.dart' as GameManager;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color color1 = Colors.grey[100];
  Color color2 = Colors.grey[100];
  Color color3 = Colors.grey[100];
  Color color4 = Colors.grey[100];
  Color color5 = Colors.grey[100];
  Color color6 = Colors.grey[100];
  Color color7 = Colors.grey[100];
  Color color8 = Colors.grey[100];
  Color color9 = Colors.grey[100];
  Color color10 = Colors.grey[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Násobilka")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Vyber si násobilky, které chceš procvičovat."),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("1"),
                  color: color1,
                  onPressed: () {
                    setState(() {
                      color1 = multiManager(1);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("2"),
                  color: color2,
                  onPressed: () {
                    setState(() {
                      color2 = multiManager(2);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("3"),
                  color: color3,
                  onPressed: () {
                    setState(() {
                      color3 = multiManager(3);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("4"),
                  color: color4,
                  onPressed: () {
                    setState(() {
                      color4 = multiManager(4);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("5"),
                  color: color5,
                  onPressed: () {
                    setState(() {
                      color5 = multiManager(5);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("6"),
                  color: color6,
                  onPressed: () {
                    setState(() {
                      color6 = multiManager(6);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("7"),
                  color: color7,
                  onPressed: () {
                    setState(() {
                      color7 = multiManager(7);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("8"),
                  color: color8,
                  onPressed: () {
                    setState(() {
                      color8 = multiManager(8);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("9"),
                  color: color9,
                  onPressed: () {
                    setState(() {
                      color9 = multiManager(9);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("10"),
                  color: color10,
                  onPressed: () {
                    setState(() {
                      color10 = multiManager(10);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text(
                  "Jdu na to!",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
                onPressed: () {
                  if (GameManager.multi.length > 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MathPage()));
                  }
                })
          ],
        ),
      ),
    );
  }

  Color multiManager(int value) {
    if (GameManager.multi.contains(value)) {
      GameManager.multi.remove(value);
      return Colors.grey[100];
    } else {
      GameManager.multi.add(value);
      return Colors.green[400];
    }
  }
}
