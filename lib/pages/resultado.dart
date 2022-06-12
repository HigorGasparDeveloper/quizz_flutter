import 'package:flutter/material.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class Resultado extends StatefulWidget {
  Map<int, int> responses = {};
  Resultado(this.responses, {Key? key}) : super(key: key);

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  // ignore: non_constant_identifier_names
  Map<int, int> correct_response = {0: 2, 1: 2, 2: 2, 3: 2, 4: 2};
  @override
  // ignore: must_call_super
  void initState() {
    verificaResultado();
  }

  int acertos = 0;

  String messageTitle = "";
  String messageSubtitle = "Você acertou ";
  // ignore: non_constant_identifier_names
  List<Color> colors_circles = [];
  void verificaResultado() {
    for (int i = 0; i < correct_response.length; i++) {
      if (widget.responses.containsKey(i)) {
        if (widget.responses[i] == correct_response[i]) {
          acertos++;
          colors_circles.add(Colors.green);
        } else {
          colors_circles.add(Colors.red);
        }
      }
    }
    if (acertos >= 3) {
      messageTitle = "Parabéns!";
    } else {
      messageTitle = "Ah, que pena! Foi quase lá.";
    }
    // ignore: unnecessary_brace_in_string_interps
    messageSubtitle += " ${acertos} questões.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            messageTitle,
            style: const TextStyle(color: Colors.red, fontSize: 30),
          ),
          Text(
            messageSubtitle,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RaisedButton(
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const HomePage()))
                },
                child: Text("Retornar à tela inicial"),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: colors_circles[0],
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text(
                    "1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colors_circles[1],
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text("2",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colors_circles[2],
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text("3",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colors_circles[3],
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text("4",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colors_circles[4],
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text("5",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
