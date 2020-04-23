import 'package:flutter/material.dart';
import 'package:quizzer/question.dart';


void main () => runApp (Quizzer());

class Quizzer extends StatelessWidget
{
   @override
   Widget build(BuildContext context)
   {
     return MaterialApp
     (
       debugShowCheckedModeBanner: false,
         home:Scaffold
         (
             backgroundColor: Colors.black,
             body:SafeArea
             (
                 child:Padding
                 (
                   padding: EdgeInsets.symmetric(horizontal:10.0),
                   child:Quizpage(),
                 ),
             )
         ),
     );
   } 
}

class Quizpage extends StatefulWidget
{
  @override
  QuizpageState createState() => QuizpageState();
}

class QuizpageState extends State<Quizpage>
{
  List<Icon> scorekeeper=[];
  
   List<Question> questionBank =
   [
     Question(q: "Do modules and scripts are same in python  ? " ,a:false),
     Question(q: "Freeware is a software that is available for use at no monetary cost ", a:true),
     Question(q: "Do Dart Supports OOPS ? ", a:true),
     Question(q: "IPv6 Internet Protocol is required as eight group of four octal digits " ,a:false),
     Question(q: "A hexadecimal number system contains digit from 1-15 " ,a:false),
     Question(q: "Worm and torjan horses are easily detected and eleminated by antivirus software" ,a:true),
   ];
    int questionnumber=0;
    void press(bool b)
    {
       if(b==true)
       {
          print("You Pressed YES !!");
       }
       else
       {
          print("You Pressed NO !!!");
       }
    }
  @override
  Widget build(BuildContext context)
  {
      return Column
      (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>
          [
               Expanded
               (
                   flex:5,
                   child:Padding
                   (
                       padding: EdgeInsets.all(10.0),
                       child:Center
                       (
                          child:Text
                          (
                              questionBank[questionnumber].questiontext,
                              textAlign: TextAlign.center,
                              style:TextStyle
                              (
                                  fontSize: 25.0,
                                  color:Colors.white,  
                              ),
                          ),
                       )
                   ),
               ),
               Expanded
               (
                  child: Padding
                  (
                      padding: EdgeInsets.all(15.0),
                      child:FlatButton
                      ( 
                         textColor: Colors.white,
                         color:Colors.green,
                         child:Text
                           (
                              "True ",
                               style:TextStyle
                               (
                                   color:Colors.white,
                                   fontSize: 20.0,
                                   fontWeight: FontWeight.bold,
                               ),
                           ),
                           onPressed:()
                           {
                              
                               setState(()
                                { 
                                   press(true);
                                     bool correct = questionBank[questionnumber].questionanswer;
                                     if(correct==true)
                                     {
                                       scorekeeper.add
                                        (
                                           Icon
                                            (
                                               Icons.check,
                                               color:Colors.green,
                                            )
                                        );
                                     }
                                     else
                                     {
                                        scorekeeper.add
                                        (
                                           Icon
                                            (
                                               Icons.close,
                                               color:Colors.red,
                                            )
                                        );
                                     }
                                     questionnumber++;
                               
                               });
                            
                           }, 
                      )
                  ),
               ),
              Expanded
               (
                  child: Padding
                  (
                      padding: EdgeInsets.all(15.0),
                      child:FlatButton
                      (
                         textColor: Colors.white,
                         color:Colors.red,
                         child:Text
                           (
                              "False ",
                               style:TextStyle
                               (
                                   color:Colors.white,
                                   fontSize: 20.0,
                               ),
                           ),
                           onPressed:()
                           {
                              setState(()
                                {
                                  press(false);
                                   bool correct = questionBank[questionnumber].questionanswer;
                                     if(correct==false)
                                     {
                                       scorekeeper.add
                                        (
                                           Icon
                                            (
                                               Icons.check,
                                               color:Colors.green
                                            )
                                        );
                                      
                                     }
                                     else
                                     {
                                         scorekeeper.add
                                        (
                                           Icon
                                            (
                                               Icons.close,
                                               color:Colors.red,
                                            )
                                        );
                                     }
                                     questionnumber++;
                                   print("You answered NO !!!");
                                  
                                });
                           }, 
                      )
                  ),
               ),
               Row(children:scorekeeper,),
          ],
      );
  }
}