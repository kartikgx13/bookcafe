import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';

List<int> data=[4,3,2,1];
List<String> bookname=["Act of Treason","Extreme measures","Protect and Defend","Triple Identity"];
List<AssetImage> fant_img=[
  AssetImage('images/t1.jpg'),
  AssetImage('images/t2.jpg'),
  AssetImage('images/t3.jpg'),
  AssetImage('images/t4.jpg'),
];
List<String> drivelink_F=[
  'https://drive.google.com/file/d/1Lp6ssjcvGt5APC_22drDPdb21bWusBYl/view?usp=sharing',
  'https://drive.google.com/file/d/1xeuCYoXO7AY9TDliF3QFommOk4kONYNW/view?usp=sharing',
  'https://drive.google.com/file/d/1DIyKzXPxS--JzN2s8fblzYLq4YLH3OyZ/view?usp=sharing',
  'https://drive.google.com/file/d/1IbW5qi-ZeVIseOej9PRrs_RG8aGxQAms/view?usp=sharing',
];
List<String> description=[
  "It's a gorgeous autumn day in Georgetown. The Democratic candidates for president and vice president of the United States are dutifully glad-handing voters and the media outside a grand estate where a national security conference has just been held, bringing together the world's greatest minds to discuss the issues that are threatening the country. It's American politicking at its best. That's when all hell breaks loose.",
  "In the secretive world where fearless men and women wage a daily covert war, the CIA has intercepted two terrorist cells--but a third, led by a dangerous mastermind, is feared to be on the loose. Counterterrorist agent Mitch Rapp joins forces with a warrior as dedicated—and lethal—as they come: ex-Marine and elite operative Mike Nash. Both Rapp and Nash have stared down the jihadist culture of death. Both have saved thousands of lives without accolades or acknowledgment of their personal sacrifices",
  "With Iran on the brink of developing a nuclear weapon, Israel is forced to react. In a daring raid, Israel destroys Iran's main nuclear facility, creating a radioactive tomb and an environmental disaster. An outraged United Nations condemns the attacks while Iran swears vengeance against Israel and her chief backer: the USA.",
  "In his debut, Carmon introduces Dan Gordon, a former Mossad operative now working for the U.S. Department of Justice. His mission to track down millions in stolen funds leads him around the world as he uncovers an international plot involving murder, conspiracy, kidnapping, and secret identities.",
];

void _launchURL(index) async {
  if (!await launch(drivelink_F[index])) throw "Could not launch $drivelink_F";
}

class Thriller extends StatefulWidget {
  const Thriller({Key? key}) : super(key: key);

  @override
  State<Thriller> createState() => _ThrillerState();
}

class _ThrillerState extends State<Thriller> {

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
                            Colors.grey,
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
                            onSurface: Colors.grey[600],
                            primary: Colors.grey[600],
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
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
              top: -750,
              bottom: 30,
              child: Container(decoration: BoxDecoration(color: Colors.grey[700],shape: BoxShape.circle))),
          Positioned.fill(
              top: -540,
              child: Center(child: Text('Thriller',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)))),
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
