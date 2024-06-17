import 'package:flutter/material.dart';

void main() => runApp(KalkulatorApp());

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalkulatorHome(),
    );
  }
}

class KalkulatorHome extends StatefulWidget {
  @override
  _KalkulatorHomeState createState() => _KalkulatorHomeState();
}

class _KalkulatorHomeState extends State<KalkulatorHome> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool isOperandActive = false;

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      isOperandActive = false;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      isOperandActive = true;
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      isOperandActive = false;
    } else {
      _output = _output + buttonText;
      isOperandActive = false;
    }

    setState(() {
      output = isOperandActive
          ? operand
          : double.parse(_output)
              .toStringAsFixed(_output.contains(".") ? 1 : 0);
    });
  }

  Widget buildButton(String buttonText, bool isButtonAction) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                isButtonAction ? Colors.orange : Colors.grey),
            shape: MaterialStateProperty.all<CircleBorder>(
              CircleBorder(),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF32012F),
        title: const Text(
          "Kalkulator Sederhana",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xFF32012F),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButton("7", false),
                    buildButton("8", false),
                    buildButton("9", false),
                    buildButton("/", true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButton("4", false),
                    buildButton("5", false),
                    buildButton("6", false),
                    buildButton("x", true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButton("1", false),
                    buildButton("2", false),
                    buildButton("3", false),
                    buildButton("-", true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButton(".", false),
                    buildButton("0", false),
                    buildButton("00", false),
                    buildButton("+", true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildButton("C", true),
                    buildButton("=", true),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
