import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget{
    String? buttonText;
    VoidCallback? onPressed;

   Button({super.key,required this.buttonText,required this.onPressed});

        @override
        Widget build(BuildContext context) {
          return  InkWell(
                onTap:onPressed ,
                child: 
               Container(
              height: 60,
              color: AppColors.mainButtonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(buttonText!,style: const TextStyle(color: Colors.white,fontSize:35,fontWeight: FontWeight.bold),)
              ],
              )
              ),
              );
        }
}