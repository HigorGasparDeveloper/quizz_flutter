// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';
import 'resultado.dart';

class Questionario extends StatefulWidget {
  const Questionario({Key? key}) : super(key: key);

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  @override
  void initState() {
    super.initState();
  }

  void selecionaResposta(int index) {
    responses[countQuestion] = index;
    setState(() {
      _buttons_options.clear();
      _buttons_colors[countQuestion][index] = Colors.red[300];
      for (int i = 0; i < 4; i++) {
        if (i != index) {
          _buttons_colors[countQuestion][i] = Colors.red;
        }
      }
    });
    responses[countQuestion] = index;
  }

  List<String> questions = [
    'Qual dos filmes da Marvel abaixo fazem relação ao \n multiverso?',
    'O multiverso surgiu na marvel pela primeira vez em \n que ano?',
    'O multiverso marvel é:',
    'Recentemente, foi lançado o filme "Doutor estranho \nno multiverso da loucura", na marvel. No filme, \nexiste uma personagem que pode viajar entre os  \nuniversos.Que personagem é?',
    'No filme "Homem aranha sem volta para casa" \naparecem quantos homens aranha? De onde eles \nvieram?'
  ];

  Map<int, int> responses = {};

  List<List<String>> options = [
    [
      'Capitão américa: guerra civil',
      'Homem de ferro',
      'Homem aranha - sem volta pra casa',
      'Os vingadores',
    ],
    ['2016', '2014', '1977', '1998'],
    [
      'Conjunto de vilões que se unem em só um universo, afim da conquista',
      'Habitado por alienígenas',
      'Uma coleção de universos alternativos que compartilham uma hierarquia universal',
      'Super heróis que atravessam diferentes universos',
    ],
    ['Charles', 'Sara', 'America', 'Wanda'],
    [
      '3. Todos do mesmo universo',
      '2. De universos diferentes.',
      '3. Cada um de um universo',
      '5. 2 do mesmo universo e 3 de universos diferentes.'
    ]
  ];
  int countQuestion = 0;
  // ignore: non_constant_identifier_names
  List<Widget> _buttons_options = [];
  Map<int, Widget> _child_buttons_flutter = {
    0: Text("Voltar"),
    1: Icon(Icons.arrow_forward)
  };
  // ignore: non_constant_identifier_names
  final _buttons_colors = {};
  // ignore: non_constant_identifier_names
  void goToNext() {
    if (countQuestion < (questions.length) - 1) {
      setState(() {
        _buttons_options.clear();
        if (countQuestion == 3) {
          _child_buttons_flutter[1] = Text("Finalizar");
        }
        _child_buttons_flutter[0] = Icon(Icons.arrow_back);
        countQuestion++;
      });
      return;
    }

    returnAlertDialog(
        'Aviso',
        'Deseja visualizar as respostas?',
        'Sim',
        'Não',
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Resultado(responses)))
            });
  }

  void goToBack() {
    if (countQuestion > 0) {
      setState(() {
        _buttons_options.clear();
        if (countQuestion != 3) {
          _child_buttons_flutter[1] = Icon(Icons.arrow_forward);
        }
        if (countQuestion == 1) {
          _child_buttons_flutter[0] = Text("Voltar");
        }
        countQuestion--;
      });
    } else {
      returnAlertDialog(
          'Aviso',
          'Tem certeza que deseja sair do quizz?',
          'Sim',
          'Cancelar',
          () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()))
              });
    }
  }

  void returnAlertDialog(String title, String message, String textConfirm,
      String textCancel, Function action) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(textCancel),
          ),
          TextButton(
            onPressed: () => action(),
            child: Text(textConfirm),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    List<String> option = options.elementAt(countQuestion);
    List<dynamic> colors = [];
    for (int k = 0; k < option.length; k++) {
      String opt = option.elementAt(k);
      colors.add(Colors.red);
      if (!_buttons_colors.containsKey(countQuestion)) {
        _buttons_colors[countQuestion] = colors;
      }
      // if (_buttons_options.isEmpty) {
      // _buttons_options.add(SizedBox(
      //   width: double.infinity,
      //   child: RaisedButton(
      //     onPressed: () => {selecionaResposta(k)},
      //     color: _buttons_colors[countQuestion][k],
      //     child: Text(
      //       opt,
      //       style: const TextStyle(color: Colors.white, fontSize: 16),
      //     ),
      //   ),
      // ));
      _buttons_options.add(ListTile(
        title: Text(
          opt,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        // tileColor: Colors.red, //cor do background das opções
        selectedColor: Colors.red,
        leading: Radio<int>(
          value: k,
          groupValue: responses[countQuestion],
          onChanged: (int? value) {
            setState(() {
              _buttons_options.clear();
              responses[countQuestion] = value!;
            });
          },
          activeColor: Colors.red,
        ),
      ));
      // }
    }
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            children: [
              SizedBox(
                height: (deviceInfo.size).height / 4,
                child: Image.asset(
                  'assets/images/test.png',
                  width: 180,
                ),
              ),
              SizedBox(
                height: (deviceInfo.size).height / 5,
                child: Row(
                  children: [
                    Text(
                      '${countQuestion + 1}. ',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      questions.elementAt(countQuestion),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Column(
                children: [..._buttons_options],
              ),
            ],
          )),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ((deviceInfo.size).width / 2) - 15,
            child: RaisedButton(
              onPressed: () => goToBack(),
              child: _child_buttons_flutter[0],
            ),
          ),
          Container(
            width: ((deviceInfo.size).width / 2) - 15,
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: RaisedButton(
              onPressed: () => goToNext(),
              child: _child_buttons_flutter[1],
            ),
          )
        ],
      ),
    );
  }
}
