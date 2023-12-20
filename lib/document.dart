import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Model/docs_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  String selectedTab = 'joining';
  List<Document> documents = [];

  get transactionList => null;

  Future<String> _loadJsonData() async {
    return await rootBundle.loadString('assets/Documents.json');
  }

  Future<List<Document>> _parseJson() async {
    String jsonData = await _loadJsonData();
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    List<dynamic> tabList = jsonMap['value'][0][selectedTab] ?? [];
    return tabList.map((e) => Document.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    _parseJson().then((data) {
      setState(() {
        documents = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Documents",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                buildTab("Joining Documents"),
                buildTab("Transaction Documents"),
                buildTab("Team Documents"),
                buildTab("Tax Documents"),
              ],
            ),
            const SizedBox(height: 16),
            documents.isEmpty
                ? const Text("No Documents available to display")
                : Expanded(
                    child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        if (selectedTab == 'transaction documents') {
                          return buildTransaction(transactionList[index]);
                        } else {
                          return buildDocumentRow(documents[index]);
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabName.toLowerCase();
          _parseJson().then((data) {
            setState(() {
              documents = data;
            });
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color:
              selectedTab == tabName.toLowerCase() ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tabName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildDocumentRow(Document document) {
    return ListTile(
      title: Text(document.title),
      trailing: IconButton(
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () {
          _viewDocument(document.url);
        },
      ),
    );
  }

  Widget buildTransaction(Transaction transaction) {
    return ListTile(
      title: Text("Transaction ID: ${transaction.transactionId}"),
      trailing: IconButton(
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () {
          _viewTransaction(transaction.url);
        },
      ),
    );
  }

  void _viewDocument(String documentUrl) async {
    if (await canLaunch(documentUrl)) {
      await launch(documentUrl);
    } else {}
  }
}

void _viewTransaction(String? transactionUrl) async {
  if (transactionUrl != null && await canLaunch(transactionUrl)) {
    await launch(transactionUrl);
  } else {
    // Handle the case where the URL can't be launched or is null
  }
}

class Document {
  final String title;
  final String size;
  final String url;

  Document({required this.title, required this.size, required this.url});

  factory Document.fromJson(Map<String, dynamic> jsonData) {
    return Document(
      title: jsonData['title'] ?? '',
      size: jsonData['size'] ?? '',
      url: jsonData['url'] ?? '',
    );
  }
}

class Transaction {
  String? address;
  int? transactionId;
  List<Documents>? documents;
  String? url; // Added URL property

  Transaction({this.address, this.transactionId, this.documents, this.url});

  Transaction.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    transactionId = json["transactionId"];
    documents = json["documents"] == null
        ? null
        : (json["documents"] as List)
            .map((e) => Documents.fromJson(e))
            .toList();
    // Assign URL here based on your data structure
    url = documents?.isNotEmpty == true ? documents![0].url : null;
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
