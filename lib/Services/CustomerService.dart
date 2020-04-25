import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_smile/Models/CustomerInfo.dart';
import 'package:test_smile/Models/ListData.dart';

Future<ListData> getCustomerInfoDaily() async {
  CustomerInfo msgCustomer;
  List<String> customerName = [];
  List<int> customerAmount = [];
  int sumAmount = 0;
  List<String> customertier = [];
  List<String> customerphone = [];
  List<int> totaltransaction = [];
  List<int> totalreward = [];
  List<int> remainingpoint = [];
  ListData listCustomer = new ListData();
  List<String> summaryTier = [];
  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-day-2020-04-01.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        if (customerName.indexOf(msgCustomer.data.list[i].customername) == -1) {
          customerName.add(msgCustomer.data.list[i].customername);
          customerAmount.add(msgCustomer.data.list[i].totalamount);
          customertier.add(msgCustomer.data.list[i].customertier);
          customerphone.add(msgCustomer.data.list[i].customerphone);
          totalreward.add(msgCustomer.data.list[i].totalreward);
          totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
          remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }
      for (var i = 0; i < customerAmount.length; i++) {
        sumAmount += customerAmount[i];
      }
    }
  });

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

  return listCustomer;
}

Future<ListData> getCustomerInfoMonth() async {
  CustomerInfo msgCustomer;
  List<String> customerName = [];
  List<int> customerAmount = [];
  int sumAmount = 0;
  List<String> customertier = [];
  List<String> customerphone = [];
  List<int> totaltransaction = [];
  List<int> totalreward = [];
  List<int> remainingpoint = [];
  ListData listCustomer = new ListData();
  List<String> summaryTier = [];

  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-month-2020-03.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);
      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        if (customerName.indexOf(msgCustomer.data.list[i].customername) == -1) {
          customerName.add(msgCustomer.data.list[i].customername);
          customerAmount.add(msgCustomer.data.list[i].totalamount);
          customertier.add(msgCustomer.data.list[i].customertier);
          customerphone.add(msgCustomer.data.list[i].customerphone);
          totalreward.add(msgCustomer.data.list[i].totalreward);
          totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
          remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < customerAmount.length; i++) {
        sumAmount += customerAmount[i];
      }
    }
  });

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

  return listCustomer;
}

Future<ListData> getCustomerInfoQuarter() async {
  CustomerInfo msgCustomer;
  List<String> customerName = [];
  List<int> customerAmount = [];
  int sumAmount = 0;
  List<String> customertier = [];
  List<String> customerphone = [];
  List<int> totaltransaction = [];
  List<int> totalreward = [];
  List<int> remainingpoint = [];

  ListData listCustomer = new ListData();
  List<String> summaryTier = [];

  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-quarter-2019-06.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        if (customerName.indexOf(msgCustomer.data.list[i].customername) == -1) {
          customerName.add(msgCustomer.data.list[i].customername);
          customerAmount.add(msgCustomer.data.list[i].totalamount);
          customertier.add(msgCustomer.data.list[i].customertier);
          customerphone.add(msgCustomer.data.list[i].customerphone);
          totalreward.add(msgCustomer.data.list[i].totalreward);
          totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
          remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < customerAmount.length; i++) {
        sumAmount += customerAmount[i];
      }
    }
  });

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

  return listCustomer;
}

Future<ListData> getCustomerInfoYear() async {
  CustomerInfo msgCustomer;
  List<String> customerName = [];
  List<int> customerAmount = [];
  int sumAmount = 0;
  List<String> customertier = [];
  List<String> customerphone = [];
  List<int> totaltransaction = [];
  List<int> totalreward = [];
  List<int> remainingpoint = [];
  ListData listCustomer = new ListData();
  List<String> summaryTier = [];

  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-year-2019-04-01.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        if (customerName.indexOf(msgCustomer.data.list[i].customername) == -1) {
          customerName.add(msgCustomer.data.list[i].customername);
          customerAmount.add(msgCustomer.data.list[i].totalamount);
          customertier.add(msgCustomer.data.list[i].customertier);
          customerphone.add(msgCustomer.data.list[i].customerphone);
          totalreward.add(msgCustomer.data.list[i].totalreward);
          totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
          remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < customerAmount.length; i++) {
        sumAmount += customerAmount[i];
      }
    }
  });

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

  return listCustomer;
}
