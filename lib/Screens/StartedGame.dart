import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/models/Player.dart';
import 'package:test/widgets/Result.dart';

class StartedGameScreen extends StatefulWidget{
  Player playerOne;
  Player playerTwo;
  StartedGameScreen({super.key, required this.playerOne,required this.playerTwo});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StartedGameScreenState();
  }
}
class _StartedGameScreenState extends State<StartedGameScreen>{
  final Map<int,Mark> listOfMoves={};
  List<int> playerOneMoves=[];
  List<int> playerTwoMoves=[];
  bool gameIsFinished=false;

  late Player playerOne;
  late Player playerTwo;
  late Player playingplayer;
  late Widget content;
  @override
  void initState() {
    // TODO: implement initState
    playerOne=widget.playerOne;
    playerTwo=widget.playerTwo;
    super.initState();
    
    int randomNum=Random().nextInt(2);
    if (randomNum==0){
      playingplayer=playerOne;
    }
    else {
      playingplayer=playerTwo;
    }

  }
  void gameChecking(){

    if (playerOneMoves.contains(1)&&playerOneMoves.contains(2)&&playerOneMoves.contains(3)){
      setState(() {
        gameIsFinished=true;
        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(1)&&playerTwoMoves.contains(2)&&playerTwoMoves.contains(3)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(4)&&playerOneMoves.contains(5)&&playerOneMoves.contains(6)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(4)&&playerTwoMoves.contains(5)&&playerTwoMoves.contains(6)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(7)&&playerOneMoves.contains(8)&&playerOneMoves.contains(9)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(7)&&playerTwoMoves.contains(8)&&playerTwoMoves.contains(9)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(1)&&playerOneMoves.contains(4)&&playerOneMoves.contains(7)){
   setState(() {
        gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(1)&&playerTwoMoves.contains(4)&&playerTwoMoves.contains(7)){
   setState(() {
            gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(2)&&playerOneMoves.contains(5)&&playerOneMoves.contains(8)){
   setState(() {
            gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);

      });

    }
    else if (playerTwoMoves.contains(2)&&playerTwoMoves.contains(5)&&playerTwoMoves.contains(8)){
   setState(() {
            gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(3)&&playerOneMoves.contains(6)&&playerOneMoves.contains(9)){
   setState(() {
            gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(3)&&playerTwoMoves.contains(6)&&playerTwoMoves.contains(9)){
         setState(() {
                  gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerTwoMoves.contains(1)&&playerTwoMoves.contains(5)&&playerTwoMoves.contains(9)){
   setState(() {
            gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(1)&&playerOneMoves.contains(5)&&playerOneMoves.contains(9)){
         setState(() {
        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (playerTwoMoves.contains(3)&&playerTwoMoves.contains(5)&&playerTwoMoves.contains(7)){
   setState(() {        gameIsFinished=true;

        content=Result(winner: playerTwo,loser: playerOne,);
      });

    }
    else if (playerOneMoves.contains(3)&&playerOneMoves.contains(5)&&playerOneMoves.contains(7)){
         setState(() {
                  gameIsFinished=true;

        content=Result(winner: playerOne,loser:playerTwo);
      });

    }
    else if (listOfMoves.keys.length==9){
      setState(() {
        content= Result(winner: playerOne,loser: playerOne);
      });
    }

    
    
  }
  


  @override
  Widget build(BuildContext context) {
    
    
    content =Column(
          children: [
            Text("${playingplayer.name}'s turn : ",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx,index){
                  return Row(
                children: [
                  !listOfMoves.keys.contains(7-3*index)?  InkWell(
                    splashColor: Colors.blue,
                    onTap: (){
                      setState(() {
                        listOfMoves[7-3*index]= playingplayer.mark==Mark.o?Mark.o:Mark.x;
                        if (playingplayer.name==playerOne.name){
                          playerOneMoves.add(7-3*index);
                          playingplayer=playerTwo;
                        }
                        else {
                          playerTwoMoves.add(7-3*index);
                          playingplayer=playerOne;
                        }
                      });
                      print(7-3*index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                    ),
                  ) : Container(
                      margin: EdgeInsets.all(8),
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                      child: Image.asset(listOfMoves[7-3*index]==Mark.x? "assets/xIcon.png":"assets/oIcon.png"),
                    ),
                  const VerticalDivider(
                    color: Colors.red,
                    thickness: 88,
                  ),!listOfMoves.keys.contains(8-3*index)?  InkWell(
                    splashColor: Colors.blue,
                    onTap: (){
                      setState(() {
                        listOfMoves[8-3*index]= playingplayer.mark==Mark.o?Mark.o:Mark.x;
                        if (playingplayer.name==playerOne.name){
                          playerOneMoves.add(8-3*index);
                          playingplayer= Player(name: playerTwo.name, mark: playerTwo.mark);

                        }
                        else {
                          playerTwoMoves.add(8-3*index);
                          playingplayer= Player(name: playerOne.name, mark: playerOne.mark);

                        }
                      });
                      print(8-3*index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                    ),
                  ) : Container(
                      margin: EdgeInsets.all(8),
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                      child: Image.asset(listOfMoves[8-3*index]==Mark.x? "assets/xIcon.png":"assets/oIcon.png"),
                    ),
                  const VerticalDivider(
                    color: Colors.red,
                    thickness: 105,
                  ),!listOfMoves.keys.contains(9-3*index)?  InkWell(
                    splashColor: Colors.blue,
                    onTap: (){
                      setState(() {
                        listOfMoves[9-3*index]= playingplayer.mark==Mark.o?Mark.o:Mark.x;
                        if (playingplayer.name==playerOne.name){
                          playerOneMoves.add(9-3*index);
                          playingplayer=playerTwo;
                        }
                        else {
                          playerTwoMoves.add(9-3*index);
                          playingplayer=playerOne;

                        }
                      });
                      print(9-3*index);
                    },
                    child: Container(
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                    ),
                  ) : Container(
            
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: 
                        [Theme.of(context).colorScheme.primary
                        ,Theme.of(context).colorScheme.onBackground,
                        Color.fromARGB(255, 255, 213, 97),
                        Theme.of(context).colorScheme.onPrimaryContainer])
                      ),
                      
                      height: 125,
                      width: 105,
                      child: Image.asset(listOfMoves[9-3*index]==Mark.x? "assets/xIcon.png":"assets/oIcon.png"),
                    ),
                 
                ],
              );
            
              }),
            )
            

          ],
        );
        gameChecking();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,Theme.of(context).colorScheme.onSecondaryContainer])),
        child: content,
      ),
    );
  }
}