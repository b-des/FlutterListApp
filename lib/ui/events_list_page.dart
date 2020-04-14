import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlistapp/models/post/post.dart';
import 'package:flutterlistapp/widgets/carousel_item.dart';
import 'package:flutterlistapp/widgets/list_item.dart';

class EventsListPage extends StatefulWidget {
  EventsListPage({Key key}) : super(key: key);

  final List<Post> entries = <Post>[
    Post("Event 1", "https://picsum.photos/500", "19/04/20"),
    Post("Event 2", "https://picsum.photos/500", "22/05/20"),
    Post("Event 3", "https://picsum.photos/500", "03/06/20"),
    Post("Event 4", "https://picsum.photos/500", "14/08/20"),
  ];

  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  bool _isListVertical = true;
  ScrollController _controller;
  PageController _pageController;
  final String _listViewStorageKey = "LIST_VIEW_KEY";
  final String _pageViewStorageKey = "PAGE_VIEW_KEY";

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _pageController = PageController(viewportFraction: 1.0);
  }


  void _switchListDir() {
    setState(() {
      _isListVertical = !_isListVertical;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          height: 42,
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset(
                                _isListVertical
                                    ? 'assets/images/ic_square.png'
                                    : 'assets/images/ic_list.png',
                                height: 21,
                              ),
                              iconSize: 21,
                              onPressed: () => _switchListDir(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildItemsListWidget(widget.entries),
                  ),
                ],
              )),
        )
    );

  }

  Widget _buildItemsListWidget(List<Post> items) {
    return _isListVertical
        ? _buildListView(context, items)
        : _buildCarouselView(context, items);
  }

  Widget _buildListView(BuildContext context, List<Post> items) {
    return ListView.builder(
        physics: ScrollPhysics(),
        controller: _controller,
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        itemCount: items.length,
        scrollDirection: Axis.vertical,
        key: new PageStorageKey(_listViewStorageKey),
        itemBuilder: (BuildContext context, int index) {
          return ListItem(items[index]);
        });
  }

  Widget _buildCarouselView(BuildContext context, List<Post> items) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
      child: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        key: new PageStorageKey(_pageViewStorageKey),
        itemBuilder: (BuildContext context, int itemIndex) {
          return CarouselItem(items[itemIndex]);
        },
      ),
    );
  }
}