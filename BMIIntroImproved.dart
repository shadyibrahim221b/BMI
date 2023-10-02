// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'BMIResult.dart';
import 'customcontainer.dart';

class BMIintroImproved extends StatefulWidget{
  const BMIintroImproved({super.key});

  @override
  State<BMIintroImproved> createState() => _BMIintroImprovedState();
}

class _BMIintroImprovedState extends State<BMIintroImproved> {
  int weightCounter=50;
  int ageCounter=10;
  int height=0;
  bool isMale=false;
  String name='shady';
  double? bodyBMI;
  String? bodyCategory;
  @override
  Widget build(BuildContext context) {
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
                CustonContainer(containerContent: 
                const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.male,size: 100,color: Colors.white,),
                    Text('Male',style: TextStyle(color: Color(0xff92939D),fontSize:20,),)
                  ],),
                  onPressed: () {
                    setState(() {
                      isMale=true;
                    });
                  },
                  containerColor: isMale?Colors.pink:AppColors.maleBackGroundcolor,
                  borders: BorderRadius.circular(20),
                ), ), 
                const SizedBox(width: 20,),
                Expanded(
                  child: CustonContainer(containerContent: 
                const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.female,size: 100,color: Colors.white,),
                    Text('Female',style: TextStyle(color: Color(0xff92939D),fontSize:20,),)
                  ],),
                  onPressed: () {
                    setState(() {
                      isMale=false;
                    });
                  },
                  containerColor: !isMale?Colors.pink:AppColors.maleBackGroundcolor,
                  borders: BorderRadius.circular(20),
                )
                )
              ],
              ),
               ),
               Expanded(child: CustonContainer(containerContent:
                Column(
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
               ),
               ), 
              Expanded(
              child:Row(
              children: [
                Expanded(child: CustonContainer(containerContent:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Weight',style: TextStyle(color: Color(0xff92939D),fontSize:20,),),
                    Text(weightCounter.toString(),style: const TextStyle(color: Colors.white,fontSize: 60,fontWeight:FontWeight.bold),),

                    Row(children: [
                      const SizedBox(width: 25,),
                      const SizedBox(height: 40,),
                      CustonContainer(containerContent: 
                        const Icon(Icons.add,color: Colors.white,size: 40,),
                        onPressed: () {
                          setState(() {
                            weightCounter++;
                          });
                        },
                         borders: BorderRadius.circular(100),
                         containerColor: const Color(0xff4C4F5E),
                         ),
                        const SizedBox(width: 8,),
                        
                        CustonContainer(containerContent: 
                        const Icon(Icons.remove,color: Colors.white,size: 40,)
                        , borders: BorderRadius.circular(100),
                        containerColor: const Color(0xff4C4F5E),
                        onPressed: () {
                          setState(() {
                            weightCounter--;
                          });
                        },
                        ),
                        ],
                         )

                  ],),
                  borders: BorderRadius.circular(20),
                
                 ),
                 ),
                const SizedBox(width: 20,),
                Expanded(child: CustonContainer(containerContent: 
              Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Age',style: TextStyle(color: Color(0xff92939D),fontSize:30,),),
                    Text(ageCounter.toString(),style: const TextStyle(color: Colors.white,fontSize: 60,fontWeight:FontWeight.bold),),

                    Row(children: [
                      const SizedBox(width: 25,),
                      const SizedBox(height: 40,),
                      CustonContainer(containerContent: 
                        const Icon(Icons.add,color: Colors.white,size: 40,),                      
                       borders: BorderRadius.circular(100),
                       containerColor: const Color(0xff4C4F5E),
                       onPressed: () {
                         setState(() {
                           ageCounter++;
                         });
                       },
                       ),
                        const SizedBox(width: 8,),
                        CustonContainer(containerContent: 
                        const Icon(Icons.remove,color: Colors.white,size: 40,),
                         borders: BorderRadius.circular(100),
                        containerColor: const Color(0xff4C4F5E),
                        onPressed: () {
                          setState(() {
                            ageCounter--;
                          });
                        },
                        )
                        ],
                         )
                  ],)
              , borders: BorderRadius.circular(20))
              )
              ],
              ),
               ),
               CustonContainer(containerContent: 
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('calculate',style: TextStyle(color: Colors.white,fontSize:35,fontWeight: FontWeight.bold),)
              ],
              ),
              containerColor: Colors.pink,
              onPressed: () {
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
              certainHeight: 60,
              )
                 
          ],

      ),
      ),

    );
  }
}
