import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String output = "0";

  String _output = "0";
  double first_number = 0.0;
  double second_number = 0.0;
  String operand = "";

  buttonPressed(String button_Text) {
    if (button_Text == "C") {
      _output = "0";
      first_number = 0.0;
      second_number = 0.0;
      operand = "";
    } else if (button_Text == "+" ||
        button_Text == "-" ||
        button_Text == "/" ||
        button_Text == "X" ||
        button_Text == "√" ||
        button_Text == "+/-" ||
        button_Text == "sin") {
      first_number = double.parse(output);

      operand = button_Text;

      _output = "0";
    } else if (button_Text == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        _output = _output + button_Text;
      }
    } else if (button_Text == "=") {
      second_number = double.parse(output);

      if (operand == "+") {
        _output = (first_number + second_number).toString();
      }
      if (operand == "-") {
        _output = (first_number - second_number).toString();
      }
      if (operand == "X") {
        _output = (first_number * second_number).toString();
      }
      if (operand == "/") {
        _output = (first_number / second_number).toString();
      }

      if (operand == "√") {
        _output = (sqrt(first_number + second_number)).toString();
      }
      if (operand == "+/-") {
        _output = (first_number * (-1)).toString();
      }

      if (operand == "sin") {
        _output = (sin(first_number + second_number)).toString();
      }

      first_number = 0.0;
      second_number = 0.0;
      operand = "";
    } else {
      _output = _output + button_Text;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget build_Butoon(String button_Text) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(32.0),
        child: new Text(
          button_Text,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        color: Colors.grey[850], //buttonm
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),

        onPressed: () => {buttonPressed(button_Text)},
        //
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        color: Colors.black87, //backround
        child: new Column(children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding:
                  new EdgeInsets.symmetric(vertical: 80.0, horizontal: 13.0),
              child: new Text(output,
                  style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          new Expanded(
            child: new Divider(
              height: 1.0,
              indent: 12.0,
            ),
          ),
          new Column(
            children: [
              new Row(children: [
                build_Butoon("C"),
                build_Butoon("sin"),
                build_Butoon("√"),
                build_Butoon("/"),
              ]),
              new Row(children: [
                build_Butoon("7"),
                build_Butoon("8"),
                build_Butoon("9"),
                build_Butoon("X"),
              ]),
              new Row(children: [
                build_Butoon("4"),
                build_Butoon("5"),
                build_Butoon("6"),
                build_Butoon("-"),
              ]),
              new Row(children: [
                build_Butoon("1"),
                build_Butoon("2"),
                build_Butoon("3"),
                build_Butoon("+"),
              ]),
              new Row(children: [
                build_Butoon("+/-"),
                build_Butoon("0"),
                build_Butoon("."),
                build_Butoon("=")
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
