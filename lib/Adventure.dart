import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["The Odyssey","Gulliver's Travels","King Solomon's mines","Moby Dick"];
List<AssetImage> fant_img=[
  AssetImage('images/a1.jpg'),
  AssetImage('images/a2.jpg'),
  AssetImage('images/a3.jpg'),
  AssetImage('images/a4.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1SHneCKcenpqxxpGJhN_r1l0UnPXgrkq6/view?usp=sharing',
  'https://drive.google.com/file/d/1HCLxFatUXAaWDBHPNtk2BPRn-UDwZrjl/view?usp=sharing',
  'https://drive.google.com/file/d/15GYDrLcZEQji8N0jcg1-PqQHptJR2YB4/view?usp=sharing',
  'https://drive.google.com/file/d/1t7xrofUPcgHt1HJm-grqWqOx0UfDo07L/view?usp=sharing',
];
List<String> description=[
  "Have you ever read a great classic and come across an unfamiliar word? There are many editions of The Odyssey.This one is worth the price if you would like to enrich your vocabulary, whether for self-improvement or for preparation in advance of entrance examinations.",
  "In Gulliver's Travels, the narrator represents himself as a reliable reporter of the fantastic adventures he has just experienced.But how far can we rely on a narrator who has been impersonated by someone else? ",
  "King Solomon's Mines, by H. Rider Haggard, is part of the Barnes & Noble Classics series, which offers quality editions at affordable prices to the student and the general reader,including new scholarship, thoughtful design, and pages of carefully crafted extras.",
  "Moby-Dick is the story of an eerily compelling madman pursuing an unholy war against a creature as vast and dangerous and unknowable as the sea itself.",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class Adventure extends StatefulWidget {
  const Adventure({Key? key}) : super(key: key);

  @override
  State<Adventure> createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {
  Widget _buildItemList(BuildContext context,int index)
  {
    if(index==data.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 550,
              width: 300,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: Center(child: Text(bookname[index],style: TextStyle(fontSize: 20.0,color: Colors.black),)),
                  ),
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: fant_img[index],

                        ),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(29)
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.brown,
                            Colors.white,
                          ],
                        )
                    ),
                    child: Center(child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description[index]),
                    ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 75,
                    child: ElevatedButton(onPressed: () {_launchURL(index);}, child: Text('Read'),
                        style: ElevatedButton.styleFrom(
                            onSurface: Colors.brown[600],
                            primary: Colors.brown[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(29))
                            )
                        )
                    ),),

                ],
              )
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.brown[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Adventure',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
          Positioned.fill(
              top: 175,
              child:
              Container(
                  child:Column(
                    children: [
                      Expanded(child: ScrollSnapList(
                        itemBuilder: _buildItemList,
                        itemSize: 300,
                        dynamicItemSize: true,
                        onReachEnd: (){print('Done !');},
                        itemCount: data.length, onItemFocus: (int ) { print('Over'); },
                      ))
                    ],
                  )
              ))
        ],
      ),
    );
  }
}
