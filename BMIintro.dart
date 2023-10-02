// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'BMIResult.dart';

class BMI extends StatefulWidget{
  const BMI({super.key});
  @override
  State<BMI> createState() => _BMIState();
}
class _BMIState extends State<BMI> {

  int weightCounter=50;
  int ageCounter=10;
  int height=0;
  bool isMale=false;
  String name='shady';
  double? bodyBMI;
  String? bodyCategory;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:AppColors.appbackgroundcolor,
      appBar:AppBar(
        backgroundColor: AppColors.appbackgroundcolor,
        centerTitle: true,
        title: Text('BMI Calculator',style: AppStyles.appBarTextStyle,),
        toolbarHeight:80.0,
      ) ,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child:Row(
              children: [
                Expanded(child: 
                InkWell(
                  onTap: () {
                    setState(() {
                        AppColors.maleBackGroundcolor=Colors.pink;
                        AppColors.femaleBackGroundcolor=AppColors.containercolor;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                  color:AppColors.maleBackGroundcolor,
                  borderRadius: BorderRadius.circular(20) 
                ),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.male,size: 100,color: Colors.white,),
                    Text('Male',style: TextStyle(color: Color(0xff92939D),fontSize:20,),)
                  ],),
                ),
                )
                ),
                const SizedBox(width: 20,),
              Expanded(child:
              InkWell(
                onTap: () {
                  setState(() {
                      AppColors.femaleBackGroundcolor=Colors.pink;
                      AppColors.maleBackGroundcolor=AppColors.containercolor;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                  color:AppColors.femaleBackGroundcolor,
                  borderRadius: BorderRadius.circular(20) 
                ),
                child:const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.female,size: 100,color: Colors.white,),
                    Text('Female',style: TextStyle(color: Color(0xff92939D),fontSize:20,),)
                  ],),
              ),
              ) 
                ),
              ],), ),
              
              Expanded(
                child: Container(
                  margin:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.containercolor,
                  borderRadius: BorderRadius.circular(10) 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Heigth',style: TextStyle(color: Color(0xff71737F),fontSize:20),),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(height.toString(),style: const TextStyle(fontSize: 32.0,color: Colors.white),),
                      const SizedBox(width: 8,),
                      const Text('cm',style: TextStyle(color: Color(0xff71737F),fontSize: 20),)
                    ],),
                  Slider(
                    activeColor: const Color(0xffEB1555),
                    inactiveColor: const Color(0xff8E8F99),
            label: "Select Height",
            value: height.toDouble(),
            onChanged: (value) {
              setState(() {
                height = value.toInt();
              });
            },
            min: 0,
            max: 300,
          ),
                ],),
                ) 
              ), 
              Expanded(
              child:Row(
              children: [
                Expanded(child:
                Container(
                  margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.containercolor,
                  borderRadius: BorderRadius.circular(20) 
                ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Weight',style: TextStyle(color: Color(0xff92939D),fontSize:20,),),
                    Text(weightCounter.toString(),style: const TextStyle(color: Colors.white,fontSize: 60,fontWeight:FontWeight.bold),),

                    Row(children: [
                      const SizedBox(width: 40,),
                      const SizedBox(height: 40,),
                     InkWell(
                      onTap: () {
                        setState(() {
                          weightCounter++;
                        });
                      },
                     child: Container(
                        margin:const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff4C4F5E),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 40,),
                        ),
                        ),
                        const SizedBox(width: 8,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              weightCounter--;
                            });
                          },
                          child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff4C4F5E),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Icon(Icons.remove,color: Colors.white,size: 40,),
                        ),
                        )
                        ],
                         )

                  ],),  
                ),
                ),
                const SizedBox(width: 20,),
              Expanded(child: Container(
                margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  color:AppColors.containercolor,
                  borderRadius: BorderRadius.circular(20) 
                ),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Age',style: TextStyle(color: Color(0xff92939D),fontSize:30,),),
                    Text(ageCounter.toString(),style: const TextStyle(color: Colors.white,fontSize: 60,fontWeight:FontWeight.bold),),

                    Row(children: [
                      const SizedBox(width: 40,),
                      const SizedBox(height: 40,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            ageCounter++;
                          });
                        },
                       child:Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff4C4F5E),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 40,),
                        ),
                        ),
                        const SizedBox(width:8,),
                        InkWell(
                          onTap:() {
                            setState(() {
                              ageCounter--;
                            });
                          },
                         child:Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff4C4F5E),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Icon(Icons.remove,color: Colors.white,size: 40,),
                        ))
                        ],
                         )
                  ],),
              )
                ),
              ],
              ),
               ),
               InkWell(
                onTap: () {
                  setState(() {
                    bodyBMI=weightCounter/(pow(height/100, 2));
                    if(bodyBMI!<=18.4){
                      bodyCategory='Unerweight';
                    }
                    else if(bodyBMI! >=18.5 && bodyBMI! <= 24.9) {
                      bodyCategory='Normal';
                    }
                    else if(bodyBMI! >= 25.0 && bodyBMI! <= 39.9) {
                      bodyCategory='Overweight';
                    }
                    else{
                      bodyCategory='Obese';
                    }
                    Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BMIResult(bodyCategory: bodyCategory,bodyBMI: bodyBMI,))
                  );
                  });
                },
                child: 
               Container(
              height: 60,
              color: AppColors.mainButtonColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('calculate',style: TextStyle(color: Colors.white,fontSize:35,fontWeight: FontWeight.bold),)
              ],
              )
              ),
              ),
                 
          ],

      ),
      ),

    );

  }
}
