import 'dart:convert';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruts/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData(
        "https://newsapi.org/v2/everything?q=apple&from=2022-11-16&to=2022-11-16&sortBy=popularity&apiKey=04b7d71b476643ada56dcc96c01a29c5");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artikel"),
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey,
              height: 300,
              width: 200,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(
                      _posts[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['description']}',
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            // subtitle: Text(
            //   '${_posts[index]['content']}',
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            onTap: () {},
          );
        },
      ),
    );
  }

  Future _getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
