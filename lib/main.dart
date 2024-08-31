import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorHome(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String expression = "";
  String result = "0";
  String lastExpression = "";
  String lastResult = "0";
  bool resultDisplayed = false;

  // Function to handle button press
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "CLEAR") {
        expression = "";
        result = "0";
      } else if (buttonText == "⌫") {
        expression = expression.isNotEmpty ? expression.substring(0, expression.length - 1) : "";
      } else if (buttonText == "=") {
        if (expression.isEmpty) {
          expression = lastExpression;
          result = lastResult;
        } else {
          try {
            String finalExpression = expression.replaceAll('√', 'sqrt');
            Parser p = Parser();
            Expression exp = p.parse(finalExpression);
            ContextModel cm = ContextModel();
            double eval = exp.evaluate(EvaluationType.REAL, cm);
            result = eval.toString();
            lastExpression = expression;
            lastResult = result;
            resultDisplayed = true;
          } catch (e) {
            result = "Error";
          }
        }
      } else {
        if (resultDisplayed) {
          expression = "";
          result = "0";
          resultDisplayed = false;
        }
        if (buttonText == "sin" || buttonText == "cos" || buttonText == "tan" || buttonText == "log" || buttonText == "√") {
          if (expression.isNotEmpty && RegExp(r'\d$').hasMatch(expression)) {
            expression += "*";
          }
          expression += buttonText == "√" ? "sqrt(" : buttonText + "(";
        } else if (buttonText == "π") {
          expression += "3.141592653589793";
        } else if (buttonText == "e") {
          expression += "2.718281828459045";
        } else if (buttonText == "%") {
          expression += "*0.01";
        } else {
          if (expression.isNotEmpty && RegExp(r'\d$').hasMatch(expression) && buttonText == "(") {
            expression += "*";
          }
          expression += buttonText;  // Correctly append button text
        }

        // Evaluate the expression dynamically
        try {
          String finalExpression = expression.replaceAll('√', 'sqrt');
          Parser p = Parser();
          Expression exp = p.parse(finalExpression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          result = "Error";
        }
      }

      print("Expression: $expression");  // Debug print
    });
  }

  // Function to build each button
  Widget buildButton(String buttonText, {Color color = Colors.black}) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, color: color),
          ),
        ),
      ),
    );
  }

  // Function to handle keyboard input
  void handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      String key = event.logicalKey.keyLabel;
      if (key == 'Enter') {
        buttonPressed('=');
      } else if (key == 'Backspace') {
        buttonPressed('⌫');
      } else if (key == 'Escape') {
        buttonPressed('CLEAR');
      } else if ('0123456789+-*/().'.contains(key)) {
        buttonPressed(key);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Building UI with expression: $expression");  // Debug print
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: handleKey,
        autofocus: true,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Display expression
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Text(
                      expression,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // Display result
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              // Row for Clear and Backspace
              Row(
                children: [
                  buildButton("CLEAR", color: Colors.red),
                  buildButton("⌫", color: Colors.red),
                ],
              ),
              // Rows for digits and operators
              Row(
                children: [
                  buildButton("("),
                  buildButton(")"),
                  buildButton("^"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("="),
                ],
              ),
              // Rows for scientific functions
              Row(
                children: [
                  buildButton("sin"),
                  buildButton("cos"),
                  buildButton("tan"),
                  buildButton("log"),
                ],
              ),
              Row(
                children: [
                  buildButton("√"),
                  buildButton("π"),
                  buildButton("e"),
                  buildButton("%"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}