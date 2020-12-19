import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';


const green = Color(0xff1ED760);
const greyBg = Color(0xff1B1B1B);
const orange = Color(0xffF8B227);

const kExpandedHeight = 500.0;

class DetailsPage extends StatefulWidget {
  String spotify, title, playBtn;

  DetailsPage({this.spotify, this.title, this.playBtn});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String spotify;
  String title;
  String playBtn;

  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
    ..addListener(() => setState(() {}));
  }

  bool get _showTitle {
    return _scrollController.hasClients
        && _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    spotify = widget.spotify;
    title = widget.title;
    playBtn = widget.playBtn;


    return Scaffold(
      backgroundColor: greyBg,
      body: Container(
        child: CustomScrollView(
          controller: _scrollController,
//          center: centerKey,
          slivers: <Widget>[
            SliverAppBar(
              title: _showTitle ? null : null,
              centerTitle: true,
              backgroundColor: Colors.black,
              collapsedHeight: 120.0,
              expandedHeight: kExpandedHeight,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: _showTitle ? SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        image: DecorationImage(
                                            image: AssetImage('images/art3.png'),
                                            fit: BoxFit.fitHeight
                                        ),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Mega',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan> [
                                          TextSpan(
                                            text: ' Hits Mix',
                                            style: TextStyle(
                                              color: orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.whatshot, color: Colors.white, size: 18,),
                                          SizedBox(width: 5,),
                                          Text(
                                            '2.4m',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Icon(Icons.access_time, color: Colors.white, size: 18,),
                                          SizedBox(width: 5,),
                                          Text(
                                            '5hr 15min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.play_arrow, size: 24, color: Colors.black,),
                                      radius: 16,
                                      backgroundColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ) : null,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/art4.png'),
                      fit: BoxFit.fitHeight
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 50,),
                        Container(
                          child: Hero(
                            tag: title,
                            child: RichText(
                              text: TextSpan(
                                text: 'Mega',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan> [
                                  TextSpan(
                                    text: ' Hits Mix',
                                    style: TextStyle(
                                      color: orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.whatshot, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(
                                '2.4m',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                                ),
                              ),
                              SizedBox(width: 20,),
                              Icon(Icons.access_time, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(
                                '5hr 15min',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Wizkid, Stonebwoy, Sarkodie, Davido, Burna Boy...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Catch all the music from latest artists you follow,\nplus new singles picked for you. Updated every Friday.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13
                          ),
                          textAlign: TextAlign.center,
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
                                      child: Icon(Icons.cloud_download, size: 20, color: Colors.white),
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                      radius: 18,
                                    ),
                                    SizedBox(width: 15,),
                                    CircleAvatar(
                                      child: Icon(Icons.thumb_up, size: 20, color: Colors.white,),
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                      radius: 18,
                                    ),
                                    SizedBox(width: 20,),
                                    Hero(
                                      tag: playBtn,
                                      child: CircleAvatar(
                                        child: Icon(Icons.play_arrow, size: 30, color: Colors.black,),
                                        radius: 24,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    CircleAvatar(
                                      child: Icon(Icons.playlist_add, size: 20, color: Colors.white,),
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                      radius: 18,
                                    ),
                                    SizedBox(width: 15,),
                                    CircleAvatar(
                                      child: Icon(Icons.more_horiz, size: 20, color: Colors.white,),
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                      radius: 18,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Hero(
                    tag: spotify,
                    child: SvgPicture.asset('images/spotify.svg', color: Colors.white,),
                  ),
                  onPressed: () {},
                ),
              ]
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(
//                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: orange,
                              radius: 28,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mega Hits Mix',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Text(
                                    'Mega Hits Mix',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '4:52',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.thumb_up, color: Colors.white,)
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
