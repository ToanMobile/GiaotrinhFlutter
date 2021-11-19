/// count : 10
/// currentPage : 1
/// hasPages : true
/// hasMorePages : true
/// lastPage : 2
/// nextPageUrl : "https://portal.ohrey.com.vn/api/v1/market-rents?page=2"
/// previousPageUrl : null
/// perPage : "10"
/// total : 16
/// pageName : "page"

class Pagination {
  Pagination({
      this.count, 
      this.currentPage, 
      this.hasPages, 
      this.hasMorePages, 
      this.lastPage, 
      this.nextPageUrl, 
      this.previousPageUrl, 
      this.perPage, 
      this.total, 
      this.pageName,});

  Pagination.fromJson(dynamic json) {
    count = json['count'];
    currentPage = json['currentPage'];
    hasPages = json['hasPages'];
    hasMorePages = json['hasMorePages'];
    lastPage = json['lastPage'];
    nextPageUrl = json['nextPageUrl'];
    previousPageUrl = json['previousPageUrl'];
    perPage = json['perPage'];
    total = json['total'];
    pageName = json['pageName'];
  }
  int? count;
  int? currentPage;
  bool? hasPages;
  bool? hasMorePages;
  int? lastPage;
  String? nextPageUrl;
  dynamic previousPageUrl;
  String? perPage;
  int? total;
  String? pageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['currentPage'] = currentPage;
    map['hasPages'] = hasPages;
    map['hasMorePages'] = hasMorePages;
    map['lastPage'] = lastPage;
    map['nextPageUrl'] = nextPageUrl;
    map['previousPageUrl'] = previousPageUrl;
    map['perPage'] = perPage;
    map['total'] = total;
    map['pageName'] = pageName;
    return map;
  }

}