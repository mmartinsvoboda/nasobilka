import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasobilka/Services/gameManager.dart' as GameManager;

class MathPage extends StatefulWidget {
  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GameManager.restart();
    GameManager.nextExample();
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    Color buttonColor = Colors.green;

    if (GameManager.answered) {
      if (GameManager.isCorrect) {
        buttonColor = Colors.green;
      } else {
        buttonColor = Colors.red;
      }
    }

    GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: buttonColor,
          title:
              Center(child: Text("Násobilka ${GameManager.multi.join(", ")}")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 3),
              child: Text(
                "Příklad číslo:             ${GameManager.counter}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 3),
              child: Text(
                "Správné odpovědi:   ${GameManager.correctCounter}/${GameManager.counter - 1}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 3),
              child: Text(
                "Špatné odpovědi:     ${GameManager.errorCounter}/${GameManager.counter - 1}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 3),
              child: Text(
                "Úspěšnost:                ${GameManager.successRate.toStringAsFixed(0)}%",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Po sobě správných: ${GameManager.streakCounter}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: GameManager.answered ? 60 : 40,
                ),
                GameManager.answered
                    ? SizedBox()
                    : Text(
                        "${GameManager.lastAnswer}",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${GameManager.num1}",
                      style: TextStyle(fontSize: 60),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("x", style: TextStyle(fontSize: 60)),
                    SizedBox(
                      width: 15,
                    ),
                    Text("${GameManager.num2}", style: TextStyle(fontSize: 60)),
                    SizedBox(
                      width: 15,
                    ),
                    Text("=", style: TextStyle(fontSize: 60)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        key: _formKey,
                        autofocus: true,
                        controller: myController,
                        maxLength: 3,
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (value) {
                          setState(() {
                            if (GameManager.check(int.parse(value))) {
                              GameManager.nextExample();
                            } else {}
                          });
                        },
                        style: TextStyle(
                          fontSize: 40,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                RaisedButton(
                    color: buttonColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Odeslat",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (GameManager.check(int.parse(myController.text))) {
                          GameManager.nextExample();
                        } else {}
                      });
                    }),
              ],
            ),
          ],
        ));
  }
}
