import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      theme: ThemeData(),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String enteredNumber = '';
  String operator = '';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CALCULATOR',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ใส่ Container เพื่อให้เลขอยู่ในกรอบ
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Color.fromARGB(255, 243, 239, 239),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white, // แก้ไขที่นี่เพิ่มสีขาว
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          enteredNumber,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // แก้ไขที่นี่เพิ่มสีดำ
                          ),
                        ),
                      ),
                      Text(
                        operator,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // แก้ไขที่นี่เพิ่มสีดำ
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Expanded(
                      
                      flex: 1,
                      child : buildNumberButton("C"),
                      
                    ),
                     Expanded(
                      
                      flex: 1,
                      child : buildNumberButton("⌫"),
                      
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('7'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('8'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('9'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton("÷"),
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('4'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('5'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('6'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton("×"),
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('1'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('2'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton('3'),
                    ),
                    Expanded(
                      flex: 1,
                      
                      child: buildNumberButton("\u2212"),
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: buildNumberButton('0'),
                    ),
                    Expanded(
                      flex: 1,
                      child: buildNumberButton("+"),
                    ),
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      
                      flex: 1,
                      child: buildNumberButton('='),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //SizedBox(width: 8.0),
        ],
      ),
    );
  }

  Widget buildNumberButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 85.0,
        height: 85.0,
        color: Color.fromARGB(255, 240, 233, 176),
        child: ElevatedButton(
          onPressed: () {
            onNumberButtonClick(label);
          },
          child: Text(label,style: TextStyle(
            color: Colors.black, // สีของตัวเลข
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
          
          style: ElevatedButton.styleFrom(
            primary: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOperatorButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 85.0,
        height: 85.0,
        child: ElevatedButton(
          onPressed: () {
            onOperatorButtonClick(label);
          },
          child: Text(label),
          style: ElevatedButton.styleFrom(
  
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }

  void onNumberButtonClick(String label) {
    setState(() {
      if (label == 'C') {
        enteredNumber = '';
        operator = '';
        result = 0.0;
      } else if (label == '⌫') {
        if (enteredNumber.isNotEmpty) {
          enteredNumber = enteredNumber.substring(0, enteredNumber.length - 1);
        }
      } else {
        enteredNumber += label;
      }
    });
  }

  void onOperatorButtonClick(String label) {
    setState(() {
      if (label == '=') {
        try {
          enteredNumber = '0';
          operator = '';
        } catch (e) {
          enteredNumber = '0';
        }
      } else {
        enteredNumber += label;
        operator = label;
      }
    });
  }
}
