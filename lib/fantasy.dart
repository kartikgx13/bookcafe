import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["A court of Thorns & Roses","Crown Of Midnight","Kingdom Of Ash","Assassins Blade"];
List<AssetImage> fant_img=[
  AssetImage('images/f2.jpg'),
  AssetImage('images/f3.jpg'),
  AssetImage('images/f4.jpg'),
  AssetImage('images/f5.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1dwTTHKxLmTI6bQl2hZ-ZESrzvWeWb7pf/view?usp=drivesdk',
  'https://drive.google.com/file/d/1e0Jz4678CUbp04KZKFiHM9IiA-5zW4D4/view?usp=drivesdk',
  'https://drive.google.com/file/d/1dwfGZU1NQyU1xFH3PxDMnWdmomfeyK0k/view?usp=drivesdk',
  'https://drive.google.com/file/d/1e-oLRTDiE_fyC_ezpOYtXn1XYWQBtxiH/view?usp=drivesdk',
];
List<String> description=[
  "A Court of Thorns and Roses is a new adult high fantasy novel series by American author Sarah Maas The story follows the journey of mortal Feyre Archeron after she is brought into the faerie lands of Prythian for murdering a faerie, and the epic love story and fierce struggle that happens after she enters the fade lands.",
  " A crown of midnight is fanatsy book by  Sarah J. Maas. Celaena, the King's Champion, must win her freedom by butchering every person the king asks her to, but she cannot bear to kill for the crown. She also reunites with an old colleague, becomes obsessed with a rebel movement, and learns more about the king's source of power.",
  "Kingdom of Ash is the seventh and final book in Sarah J. Maas's Throne of Glass Threads draw every character closer as they move towards a final battle of freedom for Erilea",
  "A prequel to Throne of Glass, this collection of five novellas offers readers a deeper look into the history of this cunning assassin and her enthralling-and deadly-world."
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class Fantasy extends StatefulWidget {
  const Fantasy({Key? key}) : super(key: key);

  @override
  State<Fantasy> createState() => _FantasyState();
}

class _FantasyState extends State<Fantasy> {
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
                          Colors.yellow,
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
                          onSurface: Colors.amber[900],
                          primary: Colors.amber[900],
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
      backgroundColor: Colors.yellow[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.yellow[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Fantasy',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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

