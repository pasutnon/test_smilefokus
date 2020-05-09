import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'DayView.dart' as _DayView;
import 'MonthView.dart' as _MonthView;
import 'QuarterView.dart' as _QuarterView;
import 'YearView.dart' as _YeahView;

class Home extends StatefulWidget {
  final int index;

  Home({Key key, this.index}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(index);
}

class _HomeState extends State<Home> {
  PageController _tabController;

  final phoneController = TextEditingController();
  bool kyc_auth = false;
  String pincode;
  bool kyc;
  final _formKey = GlobalKey<FormState>();
  int _currentIndex = 0;
  IconButton _icon_button;
  String _title_app;

  _HomeState(this._currentIndex);

  @override
  void initState() {
    _tabController = new PageController(initialPage: this._currentIndex);
    this.onTabChanged(this._currentIndex);
    ;
    super.initState();
  }

  Future onTap(int tab) {
    _tabController.jumpToPage(tab);
    print(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._currentIndex = tab;
    });

    switch (tab) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Mr.Admin",
              style: TextStyle(color: Colors.orange),
            ),
            Text("Head Quarter", style: TextStyle(color: Colors.white))
          ],
        ),
        leading: Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(
                  "https://w0.pngwave.com/png/358/473/computer-icons-user-profile-person-png-clip-art.png"),
            )),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.orange,
              ),
              onPressed: () {})
        ],
      ),
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _DayView.DayView(),
          new _MonthView.MonthView(),
          new _QuarterView.QuarterView(),
          new _YeahView.YearView(),
        ],
      ),
    );
  }
}

class TabItem {
  const TabItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  //const TabItem(title: 'Notification', icon: Icons.notifications),
  const TabItem(title: 'My Loan', icon: Icons.monetization_on),
  const TabItem(title: 'Request Loan', icon: Icons.business_center),
  const TabItem(title: 'Me', icon: Icons.person)
];
