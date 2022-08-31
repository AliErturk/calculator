import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String equation="0";
  String result ="0";
  String expression = "";

  buttonPressed(String buttonType){
    setState(() {
      if(buttonType == "AC"){
        equation="0";
        result = "0";
      }else if(buttonType=="="){
        expression=equation;
        try{
          Parser p = Parser();  // calculation from the math_expression package
          Expression exp = p.parse(expression);
          ContextModel cm=ContextModel();
          result= "${exp.evaluate(EvaluationType.REAL,cm)}";
        }catch(e){
          result = "Error";
        }
      }else{
        if(equation=="0"){
          equation=buttonType;
        }else{
          equation+=buttonType;
        }
      }
    });
  }

  Widget numButton(String buttonType, Color colorOfButton) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(buttonType);
      },
      child: Text(
        buttonType,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: colorOfButton,
      ),
    );
  }
  Widget screenShower(String dummy,double textFontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(dummy,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: textFontSize),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            screenShower(result,80),
            screenShower(equation,30),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.blueGrey)),
                numButton("8", (Colors.blueGrey)),
                numButton("9", (Colors.blueGrey)),
                numButton("AC", Colors.green),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.blueGrey)),
                numButton("5", (Colors.blueGrey)),
                numButton("6", (Colors.blueGrey)),
                numButton("+", Colors.green),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.blueGrey)),
                numButton("2", (Colors.blueGrey)),
                numButton("3", (Colors.blueGrey)),
                numButton("=", Colors.green),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 68),
              child: Row(

                children: [
                  ElevatedButton(
                    onPressed: () {
                      buttonPressed("0");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 12, 45, 12),
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: (Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }


}