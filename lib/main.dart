import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorAruzhan());
}

class CalculatorAruzhan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Aruzhan',
      home: Calculator(),

    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double first_num = 0;
  double second_num = 0;
  dynamic input ="0";
  dynamic calculation = "";
  dynamic output = "";
  dynamic first_opr = "";
  dynamic operator = "";

  Widget buttons(String butText, double butHeight, Color butColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12 * butHeight,
      color: butColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black87)
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        onPressed: (){
          makeCalculations(butText);
        },
        child: Text(
          butText,
          style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget buttonZero(String butText, double butHeight, Color butColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12 * butHeight,
      color: butColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black87)
        ),
        padding: EdgeInsets.only(left:80 ,top:20, right:80, bottom: 20),
        onPressed: (){
          makeCalculations(butText);
        },
        child: Text(
          butText,
          style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text('Calculator Aruzhan'), backgroundColor: Colors.blueGrey,),
      body: Column(
        children: <Widget>
        [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.centerRight,
            child: Text(input, style: TextStyle(fontSize: 50, color: Colors.white),),
          ),

          Expanded(child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buttons("C", 1, Colors.black54),
                          buttons("+/-",1, Colors.black54),
                          buttons("%", 1, Colors.black54),
                          buttons("÷", 1, Colors.orange),

                        ]
                    ),

                    TableRow(
                        children: [
                          buttons("7", 1, Colors.black54),
                          buttons("8",1, Colors.black54),
                          buttons("9", 1, Colors.black54),
                          buttons("x", 1, Colors.orange),

                        ]
                    ),

                    TableRow(
                        children: [
                          buttons("4", 1, Colors.black54),
                          buttons("5",1, Colors.black54),
                          buttons("6", 1, Colors.black54),
                          buttons("-", 1, Colors.orange),
                        ]
                    ),

                    TableRow(
                        children: [
                          buttons("1", 1, Colors.black54),
                          buttons("2",1, Colors.black54),
                          buttons("3", 1, Colors.black54),
                          buttons("+", 1, Colors.orange),

                        ]
                    ),

                  ],
                ),
              )
            ],
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonZero("0", 1, Colors.black54),
                buttons(".", 1, Colors.black54),
                buttons("=", 1, Colors.orange),

              ]
          ),

        ],
      ),
    );

  }

  void makeCalculations(butText)
  {
    if(butText  == "C")
    {
      first_num = 0;
      second_num = 0;
      input = "0";
      calculation = "";
      output = "";
      first_opr = "";
      operator = "";
    }

    else if( operator == "=" && butText == "=")
    {
      if(first_opr == "+")
      {
        output = make_addition();
      }
      else if( first_opr == "x")
      {
        output = make_multiplication();
      }
      else if( first_opr == "÷")
      {
        output = make_division();
      }
      else if( first_opr == "-")
      {
        output = make_substraction();
      }
    }
    else if(butText == "÷" || butText == "x" || butText == "-" || butText == "+" || butText == "=")
    {
      if(first_num == 0)
      {
        first_num = double.parse(calculation);
      }
      else
        {
        second_num = double.parse(calculation);
      }

      if(operator == "+")
      {
        output = make_addition();
      }
      else if( operator == "x")
      {
        output = make_multiplication();
      }
      else if( operator == "÷")
      {
        output = make_division();
      }
      else if( operator == "-")
      {
        output = make_substraction();
      }

      first_opr = operator;
      operator = butText;
      calculation = "";
    }
    else if(butText == "%")
    {
      calculation = first_num / 100;
      output = calculation;
    }
    else if(butText == ".")
    {
      if(!calculation.toString().contains("."))
      {
        calculation = calculation.toString() + ".";
      }
      output = calculation;
    }
    else
      {
      calculation = calculation + butText;
      output = calculation;
    }

    setState(()
    {
      input = output;
    });

  }

  String make_division()
  {
    calculation = (first_num / second_num).toString();
    first_num = double.parse(calculation);
    return calculation;
  }
  String make_multiplication()
  {
    calculation = (first_num * second_num).toString();
    first_num = double.parse(calculation);
    return calculation;
  }
  String make_substraction()
  {
    calculation = (first_num - second_num).toString();
    first_num = double.parse(calculation);
    return calculation;
  }
  String make_addition()
  {
    calculation = (first_num + second_num).toString();
    first_num = double.parse(calculation);
    return calculation;
  }

}

