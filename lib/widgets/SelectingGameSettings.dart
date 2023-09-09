import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test/Screens/HomeScreen.dart';
import 'package:test/Screens/StartedGame.dart';
import 'package:test/models/Player.dart';

class SelectingGameSettings extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectingGamesSettingsState();
  }

}
class _SelectingGamesSettingsState extends State<SelectingGameSettings>{

  Color pOneColorX=Colors.white;
  Color pOneColorO=Colors.white;
  Color pTwoColorX=Colors.white;
  Color pTwoColorO=Colors.white;
  bool? playerOneIsX;


  final playerOneController=TextEditingController();
  final playerTwoController=TextEditingController();
  @override
  void dispose(){
    super.dispose();
    playerOneController.dispose();
    playerTwoController.dispose();
  }
  void startGame(){
    String playerOneName=playerOneController.text;
    String playerTwoName=playerTwoController.text;
    if (playerOneName.isNotEmpty&&playerTwoName.isNotEmpty&&playerOneIsX!=null){
      if (playerOneIsX!){
        final playerOne=Player(name: playerOneName, mark: Mark.x);
        final playerTwo=Player(name: playerTwoName,mark:Mark.o );
        setState(() {
          Navigator.push(context, PageTransition(
            child:StartedGameScreen(playerOne: playerOne, playerTwo: playerTwo) ,type: PageTransitionType.fade,duration: const Duration(seconds: 2)));
        });

      }
      else {
        final playerOne=Player(name: playerOneName, mark: Mark.o);
        final playerTwo=Player(name: playerTwoName,mark:Mark.x );
        setState(() {
          Navigator.pushReplacement(context, PageTransition(
            child:StartedGameScreen(playerOne: playerOne, playerTwo: playerTwo) ,type: PageTransitionType.fade,duration: const Duration(seconds: 2)));
        });
        
      }

    }
    else {
      ScaffoldMessenger(child:       SnackBar(content: Text("ERROR"),duration: Duration(seconds: 3),)
);      print("alo");

      }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      SizedBox(
        height: 350,
        child:
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                        SizedBox(width:130,
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          controller: playerOneController,
                          decoration: const InputDecoration(
                            
                            label: Text("playerOneName")
                          ),
                        )),
                             Icon(Icons.edit,size:32,
                             color: Theme.of(context).colorScheme.primary,)
                          ],
                        ),
                        const SizedBox(height: 14,),
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              setState(() {
                                playerOneIsX=true;
                                pOneColorX=Colors.red;
                                pOneColorO=Colors.white;
                                pTwoColorO=Colors.red;
                                pTwoColorX=Colors.white;
                              });
                            }, child:  Text("X",style: 
                            TextStyle(fontSize: 46,color: pOneColorX ),)
                            ),
                            const SizedBox(width: 5,),
                            TextButton(onPressed: (){
                              setState(() {
                                playerOneIsX=false;
                                pOneColorX=Colors.white;
                                pOneColorO=Colors.red;
                                pTwoColorO=Colors.white;
                                pTwoColorX=Colors.red;
                              });
                            }, child:  Text("O",style: 
                            TextStyle(fontSize: 46,color: pOneColorO),))
                          ],
                        )
                      ],),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                        SizedBox(width:130,
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          controller: playerTwoController,
                          decoration: const InputDecoration(
                            label: Text("playerTwoName")
                          ),
                        )),
                             Icon(Icons.edit,size:32,
                            color: Theme.of(context).colorScheme.primary,)

                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            TextButton(onPressed: (){
                              setState(() {
                                playerOneIsX=false;
                                pOneColorX=Colors.white;
                                pOneColorO=Colors.red;
                                pTwoColorO=Colors.white;
                                pTwoColorX=Colors.red;
                              });
                            }, child:  Text("X",style: 
                            TextStyle(fontSize: 46,color: pTwoColorX),)
                            ),
                            TextButton(onPressed: (){
                              setState(() {
                                playerOneIsX=true;
                                pOneColorX=Colors.red;
                                pOneColorO=Colors.white;
                                pTwoColorO=Colors.red;
                                pTwoColorX=Colors.white;
                              });
                            }, child:  Text("O",style: 
                            TextStyle(fontSize: 46,color: pTwoColorO),))
                          ],
                        )
                      ],),
                  ),

                ],
              ),
              ElevatedButton(onPressed: startGame, style: 
              ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
              child: Text("Let the Game Begin"
              ,style: GoogleFonts.lato(fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary)))
            ],
          )
        
      
    );
  }

}