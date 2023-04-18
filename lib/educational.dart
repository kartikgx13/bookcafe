import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["Adventures in Rocket Science","Dolore's Cannon's","Harper's illustrated biochemistry","Introduction to Rocket science"];
List<AssetImage> fant_img=[
  AssetImage('images/e1.jpg'),
  AssetImage('images/e2.jpg'),
  AssetImage('images/e3.jpg'),
  AssetImage('images/e4.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1ETJEtXLaVmuZrXnaWpKxcrmSxa5moTCj/view?usp=sharing',
  'https://drive.google.com/file/d/1FXM1RpSPRuGTZ824TMJqhO1aIi2A_H4i/view?usp=sharing',
  'https://drive.google.com/file/d/1Mo-jRlb2W-q28WF8BiuMYoowiMCLbNwU/view?usp=sharing',
  'https://drive.google.com/file/d/1CWZGLNyJsItK_W-29Rw2DZE79heIYfxk/view?usp=sharing',
];
List<String> description=[
  "This guide was prepared as a tool useful for informal education venues, science clubs and related programs, and can be adopted for formal education settings. An exciting and productive study in rocket science can be implemented using the selected activities for the above-mentioned settings.",
  "Developed by Dolores Cannon during the late 1960s, QHHT began as an experimental attempt to use hypnosis to transform one's own body and the world within which it is situated. Through hypnosis, the QHHT practitioner will open the client to their subconscious. The subconscious discovered through QHHT offers up visions of the client's past lives. Indeed, these past lives make up the very notion of the subconscious itself.",
  "The Thirty-First Edition of Harper’s Illustrated Biochemistry continues to emphasize the link between biochemistry and the understanding of disease states, disease pathology, and the practice of medicine. Featuring a full-color presentation and numerous medically relevant examples, Harper’s presents a clear, succinct review of the fundamentals of biochemistry that every student must understand in order to succeed in medical school.",
  "Introduction to Rocket Science and Engineering, Second Edition, presents the history and basics of rocket science, and examines design, experimentation, testing, and applications. Exploring how rockets work, the book covers the concepts of thrust, momentum, impulse, and the rocket equation, along with the rocket engine, its components, and the physics involved in the generation of the propulsive force. ",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class Educational extends StatefulWidget {
  const Educational({Key? key}) : super(key: key);

  @override
  State<Educational> createState() => _EducationalState();
}

class _EducationalState extends State<Educational> {
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
                            Colors.green,
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
                            onSurface: Colors.green[600],
                            primary: Colors.green[600],
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
      backgroundColor: Colors.green[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.green[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Educational',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
