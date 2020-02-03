import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'calculator'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = "0";
  String a = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operend = "";
  bool flag=false;
  
  buttonPressed(String buttonText) {
    if(buttonText == 'C')
    {
      _output ='0';

    }else if(buttonText == '+/-')
    {
      _output = '-' + _output;
      
    }else if (buttonText == 'AC') {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operend = "";
      a='';
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
          if (flag=true)
          {
             num2 = double.parse(output);
      if (operend == "+") {
        _output = (num1 + num2).toString();
      } else if (operend == "-") {
        _output = (num1 - num2).toString();
      } else if (operend == "X") {
        _output = (num1 * num2).toString();
      } else if (operend == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
          }
      num1 = double.parse(output);
      if(buttonText=='X')
      {
        a=a+'x';
      }else
        {
      a=a+(buttonText);
        }
      operend = buttonText;
    
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
         a=a+buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operend == "+") {
        _output = (num1 + num2).toString();
      } else if (operend == "-") {
        _output = (num1 - num2).toString();
      } else if (operend == "X") {
        _output = (num1 * num2).toString();
      } else if (operend == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    } else {
      _output = _output + buttonText;
       a=a+buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttonText, var a) {
    return new Expanded(
            child: Container(
              color: Colors.black87,
            child: new FlatButton(
               padding: new EdgeInsets.all(24.0),
               child: new Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          color: (a==1)?Colors.transparent:Colors.blueAccent,
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
                Container(
                color: Colors.black87,
                child: new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 12.0),
                          child: new Text(a,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          ),
                    )),
                ),
               
            new Expanded(
                child: Container(
                color: Colors.black87,
                child: new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 12.0),
                          child: new Text(output,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold),
                    )),
              ),
               ),

            SafeArea(
              child: new Column(
                children: [
                  new Row(
                    children: [
                      buildbutton("AC", 1),
                      buildbutton('C', 1),
                      buildbutton('+/-', 1),
                      buildbutton('/', 2)
                    ],
                  ),
                  new Row(
                    children: [
                      buildbutton('7', 1),
                      buildbutton('8', 1),
                      buildbutton('9', 1),
                      buildbutton('X', 2)
                    ],
                  ),
                  new Row(
                    children: [
                      buildbutton('4', 1),
                      buildbutton('5', 1),
                      buildbutton('6', 1),
                      buildbutton('-', 2)
                    ],
                  ),
                  new Row(
                    children: [
                      buildbutton('1', 1),
                      buildbutton('2', 1),
                      buildbutton('3', 1),
                      buildbutton('+', 2)
                    ],
                  ),
                  new Row(
                    children: [
                      buildbutton('.', 1),
                      buildbutton('0', 1),
                      buildbutton('00', 1),
                      buildbutton('=', 2),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        )));
  }
}
 