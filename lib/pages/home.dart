import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruts/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutteruts/pages/aboutme.dart';
import 'package:flutteruts/pages/add_data.dart';
import 'package:flutteruts/pages/artikel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('ANGGIT APP');
  }

  Widget _nama() {
    return Text(
      "Hi, Selamat Datang di Anggit app Dashboard",
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'User email',
      style: TextStyle(fontSize: 20.0),
    );
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: signOut,
                child: Text("Logout"),
              )
            ];
          })
        ],
      ),
      body: Container(
        color: Colors.indigo,
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _nama(),
            _userUid(),
            Card(
              color: Colors.pink,
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.house,
                        size: 70,
                        color: Colors.yellow,
                      ),
                      Text("Home", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.green,
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsPage()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.article,
                        size: 70,
                        color: Colors.redAccent,
                      ),
                      Text("Berita", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.orange,
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InsertData()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.people,
                        size: 70,
                        color: Colors.pink,
                      ),
                      Text("Data Tamu", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.cyan,
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tentang()));
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.person_2_sharp,
                        size: 70,
                        color: Colors.green,
                      ),
                      Text("Tentang", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
