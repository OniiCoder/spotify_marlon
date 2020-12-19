import 'package:flutter/material.dart';
import 'package:spotify_marlon/pages/DetailsPage.dart';
import 'package:flutter_svg/flutter_svg.dart';


const green = Color(0xff1ED760);
const greyBg = Color(0xff1B1B1B);
const orange = Color(0xffF8B227);
const darkGreen = Color(0xff347157);
const grey = Color(0xffA09DA1);
const lightGrey = Color(0xffF0ECEC);


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBg,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Spotify',
                      style: TextStyle(
                        fontSize: 24,
                        color: green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.dashboard,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      String titleText = '';
                      Color selectedBg = index == 1 ? darkGreen : index == 2 ? grey : index == 3 ? lightGrey : Colors.black;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(spotify: 'spotify${index}', title: 'title${index}', playBtn: 'playBtn${index}')));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(22),
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                            color: selectedBg,
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage('images/art5.png')
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Hero(
                                              tag: 'spotify${index}',
                                              child: SvgPicture.asset('images/spotify.svg', color: (index == 3) ? darkGreen : Colors.white,),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 50,),
                                            Hero(
                                              tag: 'title${index}',
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Mega',
                                                  style: TextStyle(
                                                    color: (index == 3) ? darkGreen : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan> [
                                                    TextSpan(
                                                      text: ' Hits Mix',
                                                      style: TextStyle(
                                                        color: (index == 3) ? darkGreen : orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.whatshot, color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white, size: 20,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    '2.4m',
                                                    style: TextStyle(
                                                        color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white,
                                                        fontSize: 14
                                                    ),
                                                  ),
                                                  SizedBox(width: 20,),
                                                  Icon(Icons.access_time, color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white, size: 20,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    '5hr 15min',
                                                    style: TextStyle(
                                                        color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white,
                                                        fontSize: 14
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: Icon(Icons.thumb_up, size: 20, color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white,),
                                              backgroundColor: Colors.white.withOpacity(0.5),
                                              radius: 18,
                                            ),
                                            SizedBox(width: 30,),
                                            Hero(
                                              tag: 'playBtn${index}',
                                              child: CircleAvatar(
                                                child: Icon(Icons.play_arrow, size: 30, color: (index == 3) ? Colors.white : Colors.black,),
                                                radius: 28,
                                                backgroundColor: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 30,),
                                            CircleAvatar(
                                              child: Icon(Icons.playlist_add, size: 20, color: (index == 3) ? darkGreen.withOpacity(0.9) : Colors.white,),
                                              backgroundColor: Colors.white.withOpacity(0.5),
                                              radius: 18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
