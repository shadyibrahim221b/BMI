import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class CustonContainer extends StatelessWidget{

  VoidCallback? onPressed;
  Widget? containerContent;
  Color? containerColor;
  BorderRadiusGeometry? borders;
  double? certainHeight;
  CustonContainer({super.key, this.onPressed,required this.containerContent,this.containerColor=AppColors.containercolor,this.borders,this.certainHeight});

  @override
  Widget build(BuildContext context) {
    return       InkWell(
                  onTap: onPressed,
                  child: Container(
                    height: certainHeight,
                    margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  color:containerColor,
                  borderRadius: borders 
                ),
                  child:containerContent,
                ),
                );
                 }
}