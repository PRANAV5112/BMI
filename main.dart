import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  
  var result = "";
  var bgColor = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yourBMI'),
        backgroundColor: Colors.brown.shade100,
      ),
      body: Container(
        color:bgColor,
        child: Center(
          child: SizedBox(
            
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height in feets'),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 18,
                ),
                
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    
        
                    if (wt != "" && ft != "") {
                      //BMI Calculation
        
                      var iWt = double.parse(wt);
                      var iFt = double.parse(ft);
                      
                      var tM = iFt / 3.281;
                      var bmi = iWt / (tM * tM);
                      var msg = "";
                      if(bmi > 25){

                        msg = "You're Overweighted(fattyyy) haha!!";
                        bgColor = Colors.orange.shade200;
                      } else if(bmi < 18){
                        msg = "You're Underweighted(poythene) haha!!";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You're healthy!!";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = 'Please fill all the required blanks.';
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 21),
                Text(
                  result,
                  style: const TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
