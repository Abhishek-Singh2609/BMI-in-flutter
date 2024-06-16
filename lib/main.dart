import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 9, 226, 5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ""),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolors = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Check Your BMI")),
      ),
      body: Container(
        color: bgcolors,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter your weight in kgs"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter your Height in Fit"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height in Inches"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inch = incontroller.text.toString();
                      if (wt != "" && inch != "" && ft != "") {
                        //BMI Calculation
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var Iinch = int.parse(inch);

                        var tInch = (ift * 12) + Iinch;
                        var tcm = tInch * 2.54;
                        var tM = tcm / 100;
                        var bmi = iwt / (tM * tM);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are OverWeight!";
                          bgcolors = Colors.red;
                        } else if (bmi < 18) {
                          msg = " You are underWeight!";
                          bgcolors = Colors.blue;
                        } else {
                          msg = "You are healthy";
                          bgcolors = Colors.green;
                        }
                        setState(() {
                          result =
                              "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required lines";
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
