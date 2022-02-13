
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget(String title,Color? color,FontWeight? fontWeight,double? fontSize){
  return  Text(
                title,
                style: GoogleFonts.roboto(
                  color: color,
                  fontWeight: fontWeight,
                  fontStyle: FontStyle.normal,
                  fontSize:fontSize,
                ),
                textScaleFactor: 1,
              );
}

