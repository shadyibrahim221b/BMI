// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/BMI/customicon.dart';
import '../constants.dart';

class BMIResult  extends StatefulWidget{
  final String? bodyCategory;
  final double? bodyBMI;
   const BMIResult({super.key,required this.bodyCategory,required this.bodyBMI});

  @override
  State<BMIResult> createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  @override
  Widget build(BuildContext context) {
    String? bodyMessage;
            if(widget.bodyCategory=='Normal'){
                      bodyMessage='You have a ${widget.bodyCategory} body weight. Good job!';
              }
            else if(widget.bodyCategory=='Unerweight') {
              bodyMessage='You are ${widget.bodyCategory}!';
            }
            else if(widget.bodyCategory=='Overweight') {
              bodyMessage='You are ${widget.bodyCategory}!';
            }
            else{
              bodyMessage='You suffer from Obese';
            }
    return Scaffold(
      backgroundColor: AppColors.appbackgroundcolor,
      appBar:AppBar(
        backgroundColor: AppColors.appbackgroundcolor,
        centerTitle: true,
        title: Text('BMI Calculator',style: AppStyles.appBarTextStyle,),
        toolbarHeight:80.0,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Your Result',style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Colors.white),),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top:60,bottom: 20),
              decoration: BoxDecoration(
                  color:AppColors.containercolor,
                  borderRadius: BorderRadius.circular(20) 
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const SizedBox(height: 64,),
                  Text(widget.bodyCategory!,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xff24D976)),),
                  const SizedBox(height: 64,),
                  Text(widget.bodyBMI!.toStringAsFixed(2),style: const TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color:Colors.white),),
                  const SizedBox(height: 150,),
                  Text(bodyMessage,style: const TextStyle(fontSize: 20,color: Colors.white),softWrap: true,)
                ],
                )
              ],
              ),
            )
            ),
            Button(buttonText: 'Recalculate', onPressed:(){
                          Navigator.pop(context);
            }
            )
        ],),
      ),
    );
  }
}