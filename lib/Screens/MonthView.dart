import 'package:flutter/material.dart';
import 'package:test_smile/Models/CustomerInfo.dart';
import 'package:test_smile/Models/ListData.dart';
import 'package:test_smile/Services/CustomerService.dart';

class MonthView extends StatefulWidget {
  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
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
      listCustomer = await getCustomerInfoMonth();
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
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  ListView myListView() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      children: <Widget>[
        if (listCustomer.summaryTier.length != 0)
          Row(
            children: <Widget>[
              Text("Tier Name: " + listCustomer.summaryTier[0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        if (listCustomer.summaryTier.length == 0)
          Row(
            children: <Widget>[
              Text("Tier Name: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(
                "Total Members: " + listCustomer.customerName.length.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(
              "Total Rev.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "(THB)",
            ),
            Text(
              ": " + listCustomer.sumAmount.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(columns: [
            DataColumn(
                label: Text(
              "Name",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )),
            DataColumn(
                label: Text("ID",
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            DataColumn(
                label: Text("Tier",
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            DataColumn(
                label: Text("LTV",
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            DataColumn(
                label: Text("Total Trans.",
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            DataColumn(
                label: Text("Total Point",
                    style: TextStyle(fontSize: 16, color: Colors.black))),
            DataColumn(
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(padding: EdgeInsets.all(0), child: myListView()),
    );
  }
}
