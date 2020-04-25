import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_smile/Models/CustomerInfo.dart';
import 'DayView.dart' as _DayView;
import 'MonthView.dart' as _MonthView;
import 'QuarterView.dart' as _QuarterView;
import 'YearView.dart' as _YeahView;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Smilefokus"),
        ),
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicatorColor: Colors.orange,
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.calendar_today), text: "Day View"),
                        Tab(
                            icon: Icon(Icons.calendar_today),
                            text: "Month View"),
                        Tab(
                            icon: Icon(Icons.calendar_today),
                            text: "Quarter View"),
                        Tab(
                            icon: Icon(Icons.calendar_today),
                            text: "Yeah View"),
                      ],
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: Center(
              child: TabBarView(
                children: [
                  _DayView.DayView(),
                  _MonthView.MonthView(),
                  _QuarterView.QuarterView(),
                  _YeahView.YearView()
                ],
              ),
            ),
          ),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
