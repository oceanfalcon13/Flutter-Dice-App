import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String studentName = "Cr Ker";
  int diceAmount = 0;
  int diceSides = 0;
  var rollResults = [0];
  int total = 0;
  String individualResults = "";
  String coinSideImage = 'ques_mark_blue.jpg';
  bool T = true;

  @override
  Widget build(BuildContext context) {

    void startOver(){
      setState(() {
        rollResults.clear();
        diceAmount = 0;
        diceSides = 0;
        total = 0;
        individualResults = "";
      });
    }

    if(diceAmount > 0 || diceSides > 0){
      T = true;
    } else {
      diceAmount = 0;
      diceSides = 0;
    }

    void rollDice() {
      setState(() {
        var ran = new Random();
        for (int i = 0; i < diceAmount; i++){
          int nextInt = ran.nextInt(diceSides) + 1;
          print("$nextInt");
          //rollResults[i] = nextInt;
          rollResults.add(nextInt);
          total += nextInt;
        }
        individualResults = "";
        for(int j = 0; j < rollResults.length; j++){
          String resultString = rollResults[j].toString();
          individualResults += resultString + "+";
          //individualResults = "0+0";
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(studentName + "'s Scuffed Dice Roller App"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 40.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "to my Dice Roller app. \n Numbers Only Please",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              onChanged: (text) {
                try{
                  int result1 = int.parse(text);
                  setState(() {
                    diceAmount = result1;
                  });
                }
                on Exception catch (e) {
                  print("Error $e ");
                }
              },
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Amount',
              ),
            ),
            TextField(
              onChanged: (text) {
                try{
                  int result2 = int.parse(text);
                  setState(() {
                    diceSides = result2;
                  });
                }
                on Exception catch (e) {
                  print("Error $e ");
                }
              },
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Sides',
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  print('Roll Dice');
                  rollDice();
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //add border radius here
                    child: Image.asset('images/flip_coin.png'),
                  ),
                ),
              ),
            ),
            Text(
              'Rolled $diceAmount d $diceSides . Result = $total \n'
                  'Individual: ' + individualResults,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              onPressed: () {
                print('Start over');
                startOver();
              },
              child: Text(
                'Start Over',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.announcement,
                  color: Colors.teal.shade300,
                ),
                title: Text(
                  'Click the hand to start the game \nClick Start Over to reset the counts\n Text will not be cleared',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ], // children array
        ),
      ),
    );
  } //build
}
