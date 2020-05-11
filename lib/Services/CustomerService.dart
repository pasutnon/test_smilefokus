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
  int tempCount = 0;
  int tempAmount = 0;
  bool check = false;
  int temptransaction = 0;
  int tempreward = 0;
  int tempremainingpoint = 0;

  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-day-2020-04-01.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);
      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        try {
          if (customerName.indexOf(msgCustomer.data.list[i].customername) ==
              -1) {
            customerName.add(msgCustomer.data.list[i].customername);
            customerAmount.add(msgCustomer.data.list[i].totalamount);
            customertier.add(msgCustomer.data.list[i].customertier);
            customerphone.add(msgCustomer.data.list[i].customerphone);
            totalreward.add(msgCustomer.data.list[i].totalreward);
            totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
            remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
            check = true;
          } else {
            check = false;
          }
        } catch (e) {} finally {
          if (check == true) {
            int tempArrayAmount = 0;
            int tempArrayReward = 0;
            int tempArrayTransaction = 0;
            int tempArrayRemainingPoint = 0;

            if (tempCount != 0) {
              tempArrayAmount = customerAmount[(i - tempCount)];
              var tempPlusAmount = 0;
              tempPlusAmount = (tempAmount / tempCount).round();
              tempAmount = tempAmount + tempPlusAmount;
              customerAmount.removeAt((i - tempCount));
              customerAmount.removeAt((i - tempCount) - 1);
              customerAmount.add(tempAmount);
              customerAmount.add(tempArrayAmount);

              tempArrayReward = totalreward[(i - tempCount)];
              var tempPlusReward = 0;
              tempPlusReward = (tempreward / tempCount).round();
              tempreward = tempreward + tempPlusReward;
              totalreward.removeAt((i - tempCount));
              totalreward.removeAt((i - tempCount) - 1);
              totalreward.add(tempreward);
              totalreward.add(tempArrayReward);

              tempArrayTransaction = totaltransaction[(i - tempCount)];
              var tempPlusTransaction = 0;
              tempPlusTransaction = (temptransaction / tempCount).round();
              temptransaction = temptransaction + tempPlusTransaction;
              totaltransaction.removeAt((i - tempCount));
              totaltransaction.removeAt((i - tempCount) - 1);
              totaltransaction.add(temptransaction);
              totaltransaction.add(tempArrayTransaction);

              tempArrayRemainingPoint = remainingpoint[(i - tempCount)];
              var tempPlusRemainingPoint = 0;
              tempPlusRemainingPoint = (tempremainingpoint / tempCount).round();
              tempremainingpoint = tempremainingpoint + tempPlusRemainingPoint;
              remainingpoint.removeAt((i - tempCount));
              remainingpoint.removeAt((i - tempCount) - 1);
              remainingpoint.add(tempremainingpoint);
              remainingpoint.add(tempArrayRemainingPoint);
            }
            tempCount = 0;
            tempAmount = 0;
            temptransaction = 0;
            tempreward = 0;
            tempremainingpoint = 0;
          } else {
            tempCount++;
            tempAmount += msgCustomer.data.list[i].totalamount;
            tempreward += msgCustomer.data.list[i].totalreward;
            temptransaction += msgCustomer.data.list[i].totaltransaction;
            tempremainingpoint += msgCustomer.data.list[i].remainingpoint;
          }
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        sumAmount += msgCustomer.data.list[i].totalamount;
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
  int tempCount = 0;
  int tempAmount = 0;
  bool check = false;
  int temptransaction = 0;
  int tempreward = 0;
  int tempremainingpoint = 0;
  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-month-2020-03.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);
      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        try {
          if (customerName.indexOf(msgCustomer.data.list[i].customername) ==
              -1) {
            customerName.add(msgCustomer.data.list[i].customername);
            customerAmount.add(msgCustomer.data.list[i].totalamount);
            customertier.add(msgCustomer.data.list[i].customertier);
            customerphone.add(msgCustomer.data.list[i].customerphone);
            totalreward.add(msgCustomer.data.list[i].totalreward);
            totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
            remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
            check = true;
          } else {
            check = false;
          }
        } catch (e) {} finally {
          if (check == true) {
            int tempArrayAmount = 0;
            int tempArrayReward = 0;
            int tempArrayTransaction = 0;
            int tempArrayRemainingPoint = 0;

            if (tempCount != 0) {
              tempArrayAmount = customerAmount[(i - tempCount)];
              var tempPlusAmount = 0;
              tempPlusAmount = (tempAmount / tempCount).round();
              tempAmount = tempAmount + tempPlusAmount;
              customerAmount.removeAt((i - tempCount));
              customerAmount.removeAt((i - tempCount) - 1);
              customerAmount.add(tempAmount);
              customerAmount.add(tempArrayAmount);

              tempArrayReward = totalreward[(i - tempCount)];
              var tempPlusReward = 0;
              tempPlusReward = (tempreward / tempCount).round();
              tempreward = tempreward + tempPlusReward;
              totalreward.removeAt((i - tempCount));
              totalreward.removeAt((i - tempCount) - 1);
              totalreward.add(tempreward);
              totalreward.add(tempArrayReward);

              tempArrayTransaction = totaltransaction[(i - tempCount)];
              var tempPlusTransaction = 0;
              tempPlusTransaction = (temptransaction / tempCount).round();
              temptransaction = temptransaction + tempPlusTransaction;
              totaltransaction.removeAt((i - tempCount));
              totaltransaction.removeAt((i - tempCount) - 1);
              totaltransaction.add(temptransaction);
              totaltransaction.add(tempArrayTransaction);

              tempArrayRemainingPoint = remainingpoint[(i - tempCount)];
              var tempPlusRemainingPoint = 0;
              tempPlusRemainingPoint = (tempremainingpoint / tempCount).round();
              tempremainingpoint = tempremainingpoint + tempPlusRemainingPoint;
              remainingpoint.removeAt((i - tempCount));
              remainingpoint.removeAt((i - tempCount) - 1);
              remainingpoint.add(tempremainingpoint);
              remainingpoint.add(tempArrayRemainingPoint);
            }
            tempCount = 0;
            tempAmount = 0;
            temptransaction = 0;
            tempreward = 0;
            tempremainingpoint = 0;
          } else {
            tempCount++;
            tempAmount += msgCustomer.data.list[i].totalamount;
            tempreward += msgCustomer.data.list[i].totalreward;
            temptransaction += msgCustomer.data.list[i].totaltransaction;
            tempremainingpoint += msgCustomer.data.list[i].remainingpoint;
          }
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        sumAmount += msgCustomer.data.list[i].totalamount;
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
  int tempCount = 0;
  int tempAmount = 0;
  int temptransaction = 0;
  int tempreward = 0;
  int tempremainingpoint = 0;

  bool check = false;
  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-quarter-2019-06.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);
      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        try {
          if (customerName.indexOf(msgCustomer.data.list[i].customername) ==
              -1) {
            customerName.add(msgCustomer.data.list[i].customername);
            customerAmount.add(msgCustomer.data.list[i].totalamount);
            customertier.add(msgCustomer.data.list[i].customertier);
            customerphone.add(msgCustomer.data.list[i].customerphone);
            totalreward.add(msgCustomer.data.list[i].totalreward);
            totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
            remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
            check = true;
          } else {
            check = false;
          }
        } catch (e) {} finally {
          if (check == true) {
            int tempArrayAmount = 0;
            int tempArrayReward = 0;
            int tempArrayTransaction = 0;
            int tempArrayRemainingPoint = 0;

            if (tempCount != 0) {
              tempArrayAmount = customerAmount[(i - tempCount)];
              var tempPlusAmount = 0;
              tempPlusAmount = (tempAmount / tempCount).round();
              tempAmount = tempAmount + tempPlusAmount;
              customerAmount.removeAt((i - tempCount));
              customerAmount.removeAt((i - tempCount) - 1);
              customerAmount.add(tempAmount);
              customerAmount.add(tempArrayAmount);

              tempArrayReward = totalreward[(i - tempCount)];
              var tempPlusReward = 0;
              tempPlusReward = (tempreward / tempCount).round();
              tempreward = tempreward + tempPlusReward;
              totalreward.removeAt((i - tempCount));
              totalreward.removeAt((i - tempCount) - 1);
              totalreward.add(tempreward);
              totalreward.add(tempArrayReward);

              tempArrayTransaction = totaltransaction[(i - tempCount)];
              var tempPlusTransaction = 0;
              tempPlusTransaction = (temptransaction / tempCount).round();
              temptransaction = temptransaction + tempPlusTransaction;
              totaltransaction.removeAt((i - tempCount));
              totaltransaction.removeAt((i - tempCount) - 1);
              totaltransaction.add(temptransaction);
              totaltransaction.add(tempArrayTransaction);

              tempArrayRemainingPoint = remainingpoint[(i - tempCount)];
              var tempPlusRemainingPoint = 0;
              tempPlusRemainingPoint = (tempremainingpoint / tempCount).round();
              tempremainingpoint = tempremainingpoint + tempPlusRemainingPoint;
              remainingpoint.removeAt((i - tempCount));
              remainingpoint.removeAt((i - tempCount) - 1);
              remainingpoint.add(tempremainingpoint);
              remainingpoint.add(tempArrayRemainingPoint);
            }
            tempCount = 0;
            tempAmount = 0;
            temptransaction = 0;
            tempreward = 0;
            tempremainingpoint = 0;
          } else {
            tempCount++;
            tempAmount += msgCustomer.data.list[i].totalamount;
            tempreward += msgCustomer.data.list[i].totalreward;
            temptransaction += msgCustomer.data.list[i].totaltransaction;
            tempremainingpoint += msgCustomer.data.list[i].remainingpoint;
          }
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        sumAmount += msgCustomer.data.list[i].totalamount;
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
  int tempCount = 0;
  int tempAmount = 0;
  bool check = false;
  int temptransaction = 0;
  int tempreward = 0;
  int tempremainingpoint = 0;
  await http
      .get(
          "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-year-2019-04-01.json")
      .then((response) {
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      msgCustomer = CustomerInfo.fromJson(map);
      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        try {
          if (customerName.indexOf(msgCustomer.data.list[i].customername) ==
              -1) {
            customerName.add(msgCustomer.data.list[i].customername);
            customerAmount.add(msgCustomer.data.list[i].totalamount);
            customertier.add(msgCustomer.data.list[i].customertier);
            customerphone.add(msgCustomer.data.list[i].customerphone);
            totalreward.add(msgCustomer.data.list[i].totalreward);
            totaltransaction.add(msgCustomer.data.list[i].totaltransaction);
            remainingpoint.add(msgCustomer.data.list[i].remainingpoint);
            check = true;
          } else {
            check = false;
          }
        } catch (e) {} finally {
          if (check == true) {
            int tempArrayAmount = 0;
            int tempArrayReward = 0;
            int tempArrayTransaction = 0;
            int tempArrayRemainingPoint = 0;

            if (tempCount != 0) {
              tempArrayAmount = customerAmount[(i - tempCount)];
              var tempPlusAmount = 0;
              tempPlusAmount = (tempAmount / tempCount).round();
              tempAmount = tempAmount + tempPlusAmount;
              customerAmount.removeAt((i - tempCount));
              customerAmount.removeAt((i - tempCount) - 1);
              customerAmount.add(tempAmount);
              customerAmount.add(tempArrayAmount);

              tempArrayReward = totalreward[(i - tempCount)];
              var tempPlusReward = 0;
              tempPlusReward = (tempreward / tempCount).round();
              tempreward = tempreward + tempPlusReward;
              totalreward.removeAt((i - tempCount));
              totalreward.removeAt((i - tempCount) - 1);
              totalreward.add(tempreward);
              totalreward.add(tempArrayReward);

              tempArrayTransaction = totaltransaction[(i - tempCount)];
              var tempPlusTransaction = 0;
              tempPlusTransaction = (temptransaction / tempCount).round();
              temptransaction = temptransaction + tempPlusTransaction;
              totaltransaction.removeAt((i - tempCount));
              totaltransaction.removeAt((i - tempCount) - 1);
              totaltransaction.add(temptransaction);
              totaltransaction.add(tempArrayTransaction);

              tempArrayRemainingPoint = remainingpoint[(i - tempCount)];
              var tempPlusRemainingPoint = 0;
              tempPlusRemainingPoint = (tempremainingpoint / tempCount).round();
              tempremainingpoint = tempremainingpoint + tempPlusRemainingPoint;
              remainingpoint.removeAt((i - tempCount));
              remainingpoint.removeAt((i - tempCount) - 1);
              remainingpoint.add(tempremainingpoint);
              remainingpoint.add(tempArrayRemainingPoint);
            }
            tempCount = 0;
            tempAmount = 0;
            temptransaction = 0;
            tempreward = 0;
            tempremainingpoint = 0;
          } else {
            tempCount++;
            tempAmount += msgCustomer.data.list[i].totalamount;
            tempreward += msgCustomer.data.list[i].totalreward;
            temptransaction += msgCustomer.data.list[i].totaltransaction;
            tempremainingpoint += msgCustomer.data.list[i].remainingpoint;
          }
        }
      }

      for (var i = 0; i < msgCustomer.data.summarytier.length; i++) {
        if (summaryTier.indexOf(msgCustomer.data.summarytier[i].tierName) ==
            -1) {
          summaryTier.add(msgCustomer.data.summarytier[i].tierName);
        }
      }

      for (var i = 0; i < msgCustomer.data.list.length; i++) {
        sumAmount += msgCustomer.data.list[i].totalamount;
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
