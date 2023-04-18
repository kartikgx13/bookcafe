import 'package:bookcafe/Adventure.dart';
import 'package:bookcafe/Horror.dart';
import 'package:bookcafe/educational.dart';
import 'package:bookcafe/fantasy.dart';
import 'package:bookcafe/romance.dart';
import 'package:bookcafe/sci_fi.dart';
import 'package:bookcafe/self-help.dart';
import 'package:bookcafe/thriller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('images/dashboard_.png'),
                fit: BoxFit.fitWidth
              )
            ),
          ),
          Positioned.fill(
            top: 225,
            child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 25,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:AssetImage('images/fantasy_.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(29)
                                )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width*0.5,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Fantasy()));
                                },
                                child: Center(child: Text('Fantasy',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),)),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/sci-fi.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width*0.5,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SciFi()));
                                }, child: Center(child: Text('Sci-Fi',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),)),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/adv_.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Adventure()));
                                }, child: Center(child: Text('Adventure',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),)),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/thriller.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Thriller()));
                                }, child: Text('Thriller',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/romance.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Romance()));
                                }, child: Text('Romance',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,

                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/horror.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>horror()));
                                }, child: Text('Horror',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),

                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/edu_.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Educational()));
                                }, child: Text('Educational',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    ),

                    Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage('images/self(2)_.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(29)
                                  )
                              ),
                              height: 115,
                            ),
                            SizedBox(
                              height: 32,
                              width: size.width,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SelfHelp()));
                                }, child: Text('Self-Help',style: GoogleFonts.oswald(fontSize: 20,color: Colors.blueGrey[900],fontWeight: FontWeight.bold),),
                                style: OutlinedButton.styleFrom(
                                    onSurface: Colors.blue[900],
                                    shadowColor: Colors.blue,
                                    primary: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(29)
                                        )
                                    )
                                ),
                              ),
                            ),


                          ],
                        )

                    )


                  ],
                ),
              ),
            ],
          ),)
        ],
      )


    );
  }
}
