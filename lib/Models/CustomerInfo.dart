class CustomerInfo {
  int code;
  String msg;
  Data data;

  CustomerInfo({this.code, this.msg, this.data});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Lists> list;
  List<Summarytier> summarytier;
  Summary summary;
  int total;

  Data({this.list, this.summarytier, this.summary, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<Lists>();
      json['list'].forEach((v) {
        list.add(new Lists.fromJson(v));
      });
    }
    if (json['summarytier'] != null) {
      summarytier = new List<Summarytier>();
      json['summarytier'].forEach((v) {
        summarytier.add(new Summarytier.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.summarytier != null) {
      data['summarytier'] = this.summarytier.map((v) => v.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    data['total'] = this.total;
    return data;
  }
}

class Lists {
  String customername;
  String customertier;
  String customerphone;
  int totaltransaction;
  int totalamount;
  int totalreward;
  int remainingpoint;

  Lists(
      {this.customername,
      this.customertier,
      this.customerphone,
      this.totaltransaction,
      this.totalamount,
      this.totalreward,
      this.remainingpoint});

  Lists.fromJson(Map<String, dynamic> json) {
    customername = json['customername'];
    customertier = json['customertier'];
    customerphone = json['customerphone'];
    totaltransaction = json['totaltransaction'];
    totalamount = json['totalamount'];
    totalreward = json['totalreward'];
    remainingpoint = json['remainingpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customername'] = this.customername;
    data['customertier'] = this.customertier;
    data['customerphone'] = this.customerphone;
    data['totaltransaction'] = this.totaltransaction;
    data['totalamount'] = this.totalamount;
    data['totalreward'] = this.totalreward;
    data['remainingpoint'] = this.remainingpoint;
    return data;
  }
}

class Summarytier {
  int totalMembers;
  int totalAmount;
  String tierName;

  Summarytier({this.totalMembers, this.totalAmount, this.tierName});

  Summarytier.fromJson(Map<String, dynamic> json) {
    totalMembers = json['total_members'];
    totalAmount = json['total_amount'];
    tierName = json['tier_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_members'] = this.totalMembers;
    data['total_amount'] = this.totalAmount;
    data['tier_name'] = this.tierName;
    return data;
  }
}

class Summary {
  int totaltransaction;
  int totalpoint;
  int remainingpoint;
  int lifetimevalue;

  Summary(
      {this.totaltransaction,
      this.totalpoint,
      this.remainingpoint,
      this.lifetimevalue});

  Summary.fromJson(Map<String, dynamic> json) {
    totaltransaction = json['totaltransaction'];
    totalpoint = json['totalpoint'];
    remainingpoint = json['remainingpoint'];
    lifetimevalue = json['lifetimevalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totaltransaction'] = this.totaltransaction;
    data['totalpoint'] = this.totalpoint;
    data['remainingpoint'] = this.remainingpoint;
    data['lifetimevalue'] = this.lifetimevalue;
    return data;
  }
}
