import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["Warbreaker","Time travel and wrap drives","Rocket and ray guns","Cult sci-fi movies"];
List<AssetImage> fant_img=[
  AssetImage('images/S1.png'),
  AssetImage('images/S2.png'),
  AssetImage('images/S3.png'),
  AssetImage('images/S4.png'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1E09xCrwhQ3CZ4uxzfEOS880_beJUzpxt/view?usp=drivesdk',
  'https://drive.google.com/file/d/1E3jtQllnrPKAly8DH2rvSYOjrPOO1Ci-/view?usp=drivesdk',
  'https://drive.google.com/file/d/1E5xa9LbIK8rvbKCN-nWsi2Ep1y4f3MIW/view?usp=drivesdk',
  'https://drive.google.com/file/d/1Dv26wwU1i_6qfKd-_AeAOkeS3QAC5-Ir/view?usp=drivesdk',
];
List<String> description=[
  "Warbreaker tells the story of two Idrian princesses, Vivenna and Siri. Vivenna was contracted through a treaty written before she was born to marry the God King of rival nation Hallandren",
  "In Time Travel and Warp Drives, Allen Everett and Thomas Roman take readers on a clear, concise tour of our current understanding of the nature of time and space",
  "Rocket and ray guns The Cold War saw scientists in East and West racing to create amazing new technologies, the like of which the world had never seen.",
  "A cult film or cult movie, also commonly referred to as a cult classic, is a film that has acquired a cult following. Cult films are known for their",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class SciFi extends StatefulWidget {
  const SciFi({Key? key}) : super(key: key);

  @override
  State<SciFi> createState() => _SciFiState();
}

class _SciFiState extends State<SciFi> {

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
                            Colors.deepPurple,
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
                            onSurface: Colors.deepPurple[600],
                            primary: Colors.deepPurple[600],
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
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.deepPurple[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Sci-Fi',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
