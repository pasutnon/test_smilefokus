import 'package:flutter/material.dart';
import 'package:test_smile/Models/CustomerInfo.dart';
import 'package:test_smile/Models/ListData.dart';
import 'package:test_smile/Services/CustomerService.dart';

class QuarterView extends StatefulWidget {
  @override
  _QuarterViewState createState() => _QuarterViewState();
}

class _QuarterViewState extends State<QuarterView> {
  bool isLoading = true;
  CustomerInfo msgCustomer;
  static List<String> customerName = [];
  static List<int> customerAmount = [];
  static int sumAmount = 0;
  static List<String> customertier = [];
  static List<String> customerphone = [];
  static List<int> totaltransaction = [];
  static List<int> totalreward = [];
  static List<int> remainingpoint = [];
  static List<String> summaryTier = [];
  ListData listCustomer;
  int sumTotalReward = 0;
  int sumLTV = 0;
  int sumTransaction = 0;
  int sumRemaining = 0;
  String isSelect = "Quarter View";
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    try {
      if (!mounted) return;
      setState(() {
        isLoading = true;
      });
      listCustomer = await getCustomerInfoQuarter();
    } catch (e) {
      listCustomer = new ListData(
          customerName: customerName,
          customerAmount: customerAmount,
          customerphone: customerphone,
          customertier: customertier,
          remainingpoint: remainingpoint,
          totalreward: totalreward,
          totaltransaction: totaltransaction,
          sumAmount: sumAmount,
          summaryTier: summaryTier);
      print(e);
    } finally {
      for (var i = 0; i < listCustomer.totalreward.length; i++) {
        sumTotalReward += listCustomer.totalreward[i];
      }

      for (var i = 0; i < listCustomer.totaltransaction.length; i++) {
        sumTransaction += listCustomer.totaltransaction[i];
      }
      for (var i = 0; i < listCustomer.remainingpoint.length; i++) {
        sumRemaining += listCustomer.remainingpoint[i];
      }
      listCustomer.customerName.add("Total");
      listCustomer.customerAmount.add(listCustomer.sumAmount);
      listCustomer.customerphone.add(" ");
      listCustomer.customertier.add(" ");
      listCustomer.remainingpoint.add(sumRemaining);
      listCustomer.totalreward.add(sumTotalReward);
      listCustomer.totaltransaction.add(sumTransaction);

      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  Padding myTopLeft() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          height: 50,
          child: Card(
            margin: EdgeInsets.all(0),
            borderOnForeground: true,
            color: Colors.orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                    "Total Members: " +
                        (listCustomer.customerName.length - 1).toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Total Rev.(THB) : " + listCustomer.sumAmount.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }

  Padding myTopRight() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          height: 50,
          child: Card(
            margin: EdgeInsets.all(0),
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                if (listCustomer.summaryTier.length != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(listCustomer.summaryTier[0],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                if (listCustomer.summaryTier.length == 0)
                  Row(
                    children: <Widget>[
                      Text("",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                Text(
                    "Total Members: " +
                        (listCustomer.customerName.length - 1).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "Total Rev.(THB) : " + listCustomer.sumAmount.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ));
  }

  ListView myListView() {
    return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            width: 156,
            height: 30,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.0, style: BorderStyle.solid, color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            child: DropdownButton<String>(
              hint: Text('Quarter View'),
              value: isSelect,
              style: TextStyle(
                fontSize: 16,
              ),
              underline: Container(
                height: 0,
              ),
              onChanged: (String newValue) {
                switch (newValue) {
                  case "Day View":
                    {
                      Navigator.of(context).pushReplacementNamed("/homepage");
                    }
                    break;
                  case "Month View":
                    {
                      Navigator.of(context).pushReplacementNamed("/monthView");
                    }
                    break;

                  case "Quarter View":
                    {
                      Navigator.of(context)
                          .pushReplacementNamed("/quarterView");
                    }
                    break;

                  case "Year View":
                    {
                      Navigator.of(context).pushReplacementNamed("/yearView");
                    }
                    break;
                }
                setState(() {
                  isSelect = newValue;
                });
              },
              isDense: false,
              isExpanded: false,
              items: <String>[
                "Day View",
                "Month View",
                "Quarter View",
                "Year View"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(value, style: TextStyle(color: Colors.orange))
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: myTopLeft()),
              Expanded(flex: 2, child: myTopRight()),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: [
              DataColumn(
                  numeric: true,
                  label: Text(
                    "Name",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )),
              DataColumn(
                  numeric: true,
                  label: Text("ID",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
              DataColumn(
                  numeric: true,
                  label: Text("Tier",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
              DataColumn(
                  numeric: true,
                  label: Text("LTV",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
              DataColumn(
                  numeric: true,
                  label: Text("Total Trans.",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
              DataColumn(
                  numeric: true,
                  label: Text("Total Point",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
              DataColumn(
                  numeric: true,
                  label: Text("Remaining Point",
                      style: TextStyle(fontSize: 16, color: Colors.black))),
            ], rows: [
              for (var i = 0; i < listCustomer.customerName.length; i++)
                DataRow(cells: [
                  DataCell(Text(listCustomer.customerName[i])),
                  DataCell(Text(listCustomer.customerphone[i])),
                  DataCell(Text(listCustomer.customertier[i])),
                  DataCell(Text(listCustomer.customerAmount[i].toString())),
                  DataCell(Text(listCustomer.totaltransaction[i].toString())),
                  DataCell(Text(listCustomer.totalreward[i].toString())),
                  DataCell(Text(listCustomer.remainingpoint[i].toString()))
                ])
            ]),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                child: myListView(),
              )),
    );
  }
}
