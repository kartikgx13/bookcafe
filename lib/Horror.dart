import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["Repreive","The Haunting Of Hill House","Frankenstein","Fledgling"];
List<AssetImage> fant_img=[
  AssetImage('images/h1.jpg'),
  AssetImage('images/h2.jpg'),
  AssetImage('images/h3.jpg'),
  AssetImage('images/h4.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/190qqIGtOZAGgvxzgVi-62RDVkSZPcxpe/view?usp=sharing',
  'https://drive.google.com/file/d/1_3SpVDZzJL4y_rsTg9J1nQPr5NHsSP6k/view?usp=sharing',
  'https://drive.google.com/file/d/13x7B3l_yjHtWTzWeYqdaBucJ1Jo6AddU/view?usp=sharing',
  'https://drive.google.com/file/d/1DNynNJpbtNvMSBMa2Djlb1COweI4E1ph/view?usp=sharing',
];
List<String> description=[
  "A chilling and blisteringly relevant literary novel of social horror centered around a brutal killing that takes place in a full-contact haunted escape room—a provocative exploration of capitalism",
  "Jackson's novel relies on terror rather than horror to elicit emotion in the reader,using complex relationships between the mysterious events in the house and the characters' psyches.",
  "Though Frankenstein is infused with elements of the Gothic novel and the Romantic movement, Brian Aldiss has argued for regarding it as the first true science-fiction story.",
  "Fledgling is a captivating novel that tests the limits of 'otherness' and questions what it means to be truly human.",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class horror extends StatefulWidget {
  const horror({Key? key}) : super(key: key);

  @override
  State<horror> createState() => _horrorState();
}

class _horrorState extends State<horror> {
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
                            Colors.indigo,
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
                            onSurface: Colors.indigo[600],
                            primary: Colors.indigo[600],
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
      backgroundColor: Colors.indigo[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.indigo[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Horror',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
