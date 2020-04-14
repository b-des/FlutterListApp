import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlistapp/constants/font_family.dart';

import '../constants/strings.dart';
import '../models/post/post.dart';

class ListItem extends StatelessWidget {
  Post post;

  ListItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 168.0,
                      child: CachedNetworkImage(
                        imageUrl: post.imageUrl,
                        placeholder: (context, url) => LinearProgressIndicator(),
                        errorWidget: (context, url, error) => Image(
                          image: AssetImage('assets/images/placeholder.png'),
                          fit: BoxFit.cover,
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 6,
                        top: 8,
                        child: Column(children: <Widget>[
                         _pointsWidget(post.startPoints, 'assets/images/start_point_bg_list.png', Strings.startPoints),
                         _pointsWidget(post.checkPoints, 'assets/images/start_point_bg.png', Strings.checkPoints)
                        ])),
                  ],
                ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.title,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontFamily: FontFamily.futura,
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    height: 3,
                  ),
                  Text(
                    post.date,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontFamily: FontFamily.futuraLightC,
                      decoration: TextDecoration.none,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Image.asset(
                      'assets/images/ic_check_circle.png',
                      height: 40,
                      width: 40,
                    ),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Image.asset(
                      'assets/images/ic_info_circle.png',
                      height: 40,
                      width: 40,
                    ),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _pointsWidget(int points, String icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              image: AssetImage(icon),
              height: 28,
            ),
            Positioned(
              left: 0,
              top: 4,
              child: SizedBox(
                width: 24,
                height: 28,
                child: Text(points.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: FontFamily.futuraDemi,
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0)),
              ),
            )
          ],
          alignment: AlignmentDirectional.center,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 1, 0, 2),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 6,
                fontFamily: FontFamily.futuraLightC),
          ),
        )
      ],
    );
  }
}
