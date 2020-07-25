class HistoryDetail {
  String docname, date, time, status;

  HistoryDetail({this.docname, this.date, this.time, this.status});

  HistoryDetail.fromJson(Map<String, dynamic> json) {
    docname = json['docname'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
  }
}
