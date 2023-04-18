import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Dashboard.dart';

class Bodywelcome extends StatelessWidget {
  const Bodywelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              left:-400,
              top: -1350,
              bottom: 20,
              child: Container(decoration: BoxDecoration(color: Colors.lightBlue[200],shape: BoxShape.circle))),
          Positioned.fill(
              right:-700,
              bottom: -300,
              top: 500,
              child: Container(decoration: BoxDecoration(color: Colors.lightBlue[200],shape: BoxShape.circle))),

          Positioned.fill(
            bottom: -650,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 110,
              ),
              Container(
                  height: 400,
                  width: 400,
                  child: Image.asset('images/logo.png')
              ),
              SizedBox(
                width: size.width*0.5,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                    }, child: Text('Start reading...',style: GoogleFonts.oswald(fontSize: 25)),
                  style: OutlinedButton.styleFrom(
                    onSurface: Colors.blue[900],
                    shadowColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    primary: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),


            ],
          ))
        ],
      ),
    );
  }
}
