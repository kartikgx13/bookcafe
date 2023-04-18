import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["RESISTING HAPPINESS","HOW TO WIN AN ARGUMENT","LIVING IN THE LIGHT","LIVING IN THE LIGHT"];
List<AssetImage> fant_img=[
  AssetImage('images/sf1.jpg'),
  AssetImage('images/sf2.jpg'),
  AssetImage('images/sf3.jpg'),
  AssetImage('images/sf4.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1coVS3zzQWEVfnQlvGKCJT2qsjWr118kO/view?usp=sharing',
  'https://drive.google.com/file/d/1d03qfzXjgMz1CXmmutcIKYKYXoyerxfm/view?usp=sharing',
  'https://drive.google.com/file/d/1ds50i3UgTnJhzsT5OIqsiuSsjkXEGX5v/view?usp=sharing',
  'https://drive.google.com/file/d/1czSxzucNXFvR0RRUp__aWQRodI0-CD8U/view?usp=sharing',
];
List<String> description=[
  "A true story about why we sabotage ourselves, feel overwhelmed, set aside our dreams, and lack the courage to simply be ourselves... and how to start choosing happiness again!",
  "In the second edition of this witty and infectious book, Madsen Pirie builds upon his guide to using - and indeed abusing - logic in order to win arguments. By including new chapters on how to win arguments in writing, in the pub, with a friend, on Facebook and in 140 characters (on Twitter), Pirie provides the complete guide to triumphing in altercations ranging from the everyday to the downright serious",
  "Living in the Light is a comprehensive map to growth, fulfillment, and consciousness. As we grapple with personal, national, and global challenges on many fronts, this classic work is timelier than ever. Simple yet powerful exercises on subjects including creativity, relationships, parenting, health, money, and transforming the world help us put these teachings to practical use in our daily lives.",
  "PowerUp Your Mind applies this practical knowledge for the first time and shows you how to learn.Drawing on research from a wide variety of subject areas, from neuroscience to psychology, from motivation theory to accelerated learning, from memory to diet, this book shows how everyone has the capacity to succeed and how most people use only a very small portion of their talents."
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class SelfHelp extends StatefulWidget {
  const SelfHelp({Key? key}) : super(key: key);

  @override
  State<SelfHelp> createState() => _SelfHelpState();
}

class _SelfHelpState extends State<SelfHelp> {
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
                            Colors.pink,
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
                            onSurface: Colors.pink[600],
                            primary: Colors.pink[600],
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
      backgroundColor: Colors.pink[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.pink[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Self-Help',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
