import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/widgets/SelectingGameSettings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeScreenState();
  }

}
class _homeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late  final  _controller;
  late  final CurvedAnimation _animation;
  bool gameStarting=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2));
    _animation =CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);
  }
  @override
  Widget build(BuildContext context) {
    _controller.forward();
    // TODO: implement build
    void dispose(){
      super.dispose();
      _animation.dispose();
    }
    void gameStartingModelSheet(){
      showModalBottomSheet(context: context, builder: (ctx)=>SelectingGameSettings());
    }

    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Tic-Tac",style: GoogleFonts.lato(
            fontSize: 30,
            
            color: Theme.of(context).colorScheme.onSecondaryContainer
          ),),
        ),
        body:Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,Theme.of(context).colorScheme.onSecondaryContainer]) ),
          child: ScaleTransition(
            scale: _animation,
            child: Column(
               
                    children: 
                    [
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                        child: 
                           Image.asset("assets/mainIcon.png",scale: 2,)),
                     
                      
                        ElevatedButton(onPressed: gameStartingModelSheet
                          
                       ,child: Text("Start the Game")),
                        
              ],),
          )
          
        )
      );

      
    
  }
  

}