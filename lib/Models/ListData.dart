class ListData {
  List<String> customerName = [];
  List<int> customerAmount = [];
  int sumAmount = 0;
  List<String> customertier = [];
  List<String> customerphone = [];
  List<int> totaltransaction = [];
  List<int> totalreward = [];
  List<int> remainingpoint = [];
  List<String> summaryTier = [];

  ListData(
      {this.customerName,
      this.customerAmount,
      this.customertier,
      this.customerphone,
      this.remainingpoint,
      this.totalreward,
      this.totaltransaction,
      this.sumAmount,
      this.summaryTier});
}
