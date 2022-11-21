import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class dummyItemsModel
{
  String? ImagePath;
  String? Title;
  dummyItemsModel(this.ImagePath, this.Title);
}

List<int> _index = [0,1,2,3,4,5,6,7,8,9,10,11];

List<Icon> _Icon_index = [
  Icon(Icons.notifications_none),
  Icon(Icons.notifications_active)
];

int? _CurrentPage = 0;

int _counter = 0;

CarouselController _carouselController = CarouselController();

List<dummyItemsModel> list = [
  dummyItemsModel('assets/mathematics image.jpg', 'MATHMATICS'),
  dummyItemsModel('assets/physics image.jpg', 'PHYSICS'),
  dummyItemsModel('assets/chemistry image.jpg', 'CHEMISTRY'),
  dummyItemsModel('assets/biology image.jpg', 'BIOLOGY'),
  dummyItemsModel('assets/materials image.jpg', 'MATERIALS'),
  dummyItemsModel('assets/mechanical image.jpg', 'MECHANICAL'),
  dummyItemsModel('assets/industrial image.jpg', 'INDUSTRIAL'),
  dummyItemsModel('assets/electronic image.jpg', 'ELECTRONIC'),
  dummyItemsModel('assets/computer image.jpg', 'COMPUTER'),
  dummyItemsModel('assets/chemical image.jpg', 'CHEMICAL'),
  dummyItemsModel('assets/IT image.jpg', 'IT'),
  dummyItemsModel('assets/semiconductor image.jpg', 'SEMICONDUCTOR'),
];

class Home_Page extends StatefulWidget{
  @override
  _Home_Page_State createState() => _Home_Page_State();
}

class _Home_Page_State extends State<Home_Page>{
  @override
  Widget build(BuildContext context)
  {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildMiddleScroll(),
        _buildBottom(),
      ],
    );
  }

  //Top
  Widget _buildTop()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/mathematics.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                          0,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Mathematics',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/physics.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Physics',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/chemistry.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        2,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Chemistry',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/biology.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        3,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Biology',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/materials.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        4,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Materials',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/mechanical.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        5,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Mechanical',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/industrial.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        6,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Industrial',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/electronic.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        7,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Electronic',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height:10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/computer.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        8,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Computer',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/chemical engineering.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        9,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Chemical',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/it.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        10,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'IT',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/semiconductor.png'),
                    iconSize: 60,
                    onPressed: () {
                      _carouselController.animateToPage(
                        11,
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  Text(
                    'Semiconductor',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'ReadexPro',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Middle
  Widget _buildMiddle()
  {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        onPageChanged: (e, reason)
          {
            setState(() {
              _CurrentPage = e;
              print(_CurrentPage);
            });
          },
      ),
      items: _index.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                      list[i].ImagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                 child: Text(
                   list[i].Title!,
                   style: TextStyle(
                     fontSize: 40.0,
                     fontFamily: 'AlumniSansCollegiateOne',
                     color: Colors.amberAccent,
                   ),
                 ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  //MiddelScroll
  Widget _buildMiddleScroll()
  {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        CarouselIndicator(
          count: list.length,
          index: _CurrentPage,
          color: Colors.grey,
          activeColor: Colors.deepPurpleAccent,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void _incrementCounter()
  {
    setState(() {
      _counter++;
    });
  }
  //Bottom
  Widget _buildBottom()
  {
    final items = List.generate(12, (i){
      return ListTile(
          leading: IconButton(
            onPressed: () => _incrementCounter(),
            icon: _Icon_index[_counter % 2],
          ),
          title: Text(
              '[Event] This is ' + list[i].Title! + ' Department Notification',
              style: TextStyle(
                fontFamily: 'ReadexPro',
              ),
          ),
          trailing: Icon(Icons.navigate_next),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}

