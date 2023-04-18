import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["The lake house secret","The course of love","Her last wish","Eight classic romantic suspense"];
List<AssetImage> fant_img=[
  AssetImage('images/R1.png'),
  AssetImage('images/R2.png'),
  AssetImage('images/R3.png'),
  AssetImage('images/R4.png'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1EVqDbR6PqFHTQxKVaMMcmTFarzYRSZhZ/view?usp=drivesdk',
  'https://drive.google.com/file/d/1Ebf202IrISoCy70_ijvOH31ETnVBPLu2/view?usp=drivesdk',
  'https://drive.google.com/file/d/1Drg5X8u5NwlgsHrxZwIeVyGsnCDkLaqU/view?usp=drivesdk',
  'https://drive.google.com/file/d/1Ebdsxwszd6Q0wo1VoPE6ObhUBMu6vAVJ/view?usp=drivesdk',
];
List<String> description=[
  "The lake house secret  is With her life going from bad to worse, sassy young reporter Jenessa Jones is drawn back to her small hometown by a sudden death in her family.",
  "The Course of Love is a novel that explores not so much the start of love, as its maintenance over time; the way our ideals bend and reform under the pressures of an average existence, and the magnificent",
  "Her Last Wish is an inspiring tale of love and heartbreak and it tests a man's resilience after his girlfriend is diagnosed with a fatal disease.",
  "Accidentally cupid Radhika, a pretty and fun-loving girl, has a best friend, Nishi, a vexatious short girl she met on the very first day of college",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class Romance extends StatefulWidget {
  const Romance({Key? key}) : super(key: key);

  @override
  State<Romance> createState() => _RomanceState();
}

class _RomanceState extends State<Romance> {
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
                            Colors.red,
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
                            onSurface: Colors.red[600],
                            primary: Colors.red[600],
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
      backgroundColor: Colors.red[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.red[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Romance',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
