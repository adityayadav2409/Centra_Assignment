class Document {
  List<Value>? value;

  Document({this.value});

  Document.fromJson(Map<String, dynamic> json) {
    value = json["value"] == null
        ? null
        : (json["value"] as List).map((e) => Value.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data["value"] = value?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Value {
  List<Joining>? joining;
  List<Transaction>? transaction;
  List<Team>? team;
  List<Tax>? tax;

  Value({this.joining, this.transaction, this.team, this.tax});

  Value.fromJson(Map<String, dynamic> json) {
    joining = json["joining"] == null
        ? null
        : (json["joining"] as List).map((e) => Joining.fromJson(e)).toList();
    transaction = json["transaction"] == null
        ? null
        : (json["transaction"] as List)
            .map((e) => Transaction.fromJson(e))
            .toList();
    team = json["team"] == null
        ? null
        : (json["team"] as List).map((e) => Team.fromJson(e)).toList();
    tax = json["tax"] == null
        ? null
        : (json["tax"] as List).map((e) => Tax.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (joining != null) {
      data["joining"] = joining?.map((e) => e.toJson()).toList();
    }
    if (transaction != null) {
      data["transaction"] = transaction?.map((e) => e.toJson()).toList();
    }
    if (team != null) {
      data["team"] = team?.map((e) => e.toJson()).toList();
    }
    if (tax != null) {
      data["tax"] = tax?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Tax {
  String? title;
  String? size;
  String? url;

  Tax({this.title, this.size, this.url});

  Tax.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    size = json["size"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["size"] = size;
    data["url"] = url;
    return data;
  }
}

class Team {
  String? title;
  String? size;
  String? url;

  Team({this.title, this.size, this.url});

  Team.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    size = json["size"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["size"] = size;
    data["url"] = url;
    return data;
  }
}

class Transaction {
  String? address;
  int? transactionId;
  List<Documents>? documents;

  Transaction(
      {this.address,
      this.transactionId,
      this.documents,
      required String title,
      required Future<Null> Function() onTap});

  Transaction.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    transactionId = json["transactionId"];
    documents = json["documents"] == null
        ? null
        : (json["documents"] as List)
            .map((e) => Documents.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address"] = address;
    data["transactionId"] = transactionId;
    if (documents != null) {
      data["documents"] = documents?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? title;
  String? checkListName;
  String? date;
  String? status;
  String? url;

  Documents({this.title, this.checkListName, this.date, this.status, this.url});

  Documents.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    checkListName = json["checkListName"];
    date = json["date"];
    status = json["status"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["checkListName"] = checkListName;
    data["date"] = date;
    data["status"] = status;
    data["url"] = url;
    return data;
  }
}

class Joining {
  String? title;
  String? size;
  String? url;

  Joining({this.title, this.size, this.url});

  Joining.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    size = json["size"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["size"] = size;
    data["url"] = url;
    return data;
  }
}
