// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'questionario.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String typeAsnwer = 'Dificuldade';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/test.png',
          width: 150,
        ),
        // DropdownButton<String>(
        //   value: typeAsnwer,
        //   icon: const Icon(Icons.arrow_downward),
        //   elevation: 16,
        //   style: const TextStyle(color: Colors.white, fontSize: 20),
        //   dropdownColor: Colors.black,
        //   underline: Container(
        //     height: 2,
        //     color: Colors.red,
        //   ),
        //   onChanged: (String? newValue) {
        //     setState(() {
        //       typeAsnwer = newValue!;
        //     });
        //   },
        //   items: <String>['Dificuldade', 'Fácil', 'Médio', 'Difícil']
        //       .map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        // ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          width: 200,
          height: 40,
          child: RaisedButton(
            onPressed: () => initQuestions(),
            color: Colors.red,
            child: const Text(
              'Começar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Seja bem vindo!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Cinco questões serão sorteadas para você responder. Todas sobre o universo da Marvel (filmes, séries, etc.).',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.clip,
                )
              ]),
        )
      ]),
    );
  }

  void initQuestions() async {
    //print("Começar questionário");
    await Future.delayed(const Duration(microseconds: 1000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Questionario()));
  }
}
