import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Screens/HomeScreen.dart';
import 'package:test/Screens/StartedGame.dart';
import 'package:test/models/Player.dart';

class Result extends StatelessWidget{
  final Player winner;
  final Player loser;
  const Result({super.key, required this.winner,required this.loser});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          winner.name==loser.name?
          "Draw":
          "The Winner is ${winner.name}"
        ,
        style: GoogleFonts.lato(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 45
        ),),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()=>
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)), child: const Text(
              "HomeScreen"
            )),
            const SizedBox(width: 8,),
            ElevatedButton(onPressed: ()=>
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartedGameScreen(playerOne: winner,playerTwo: loser,),)), 
            child: const Text("Restart"))
          ],
        )
        
      ],
    );
  }

}