import 'package:flutter/material.dart';

class BeforeHomePage extends StatefulWidget {
  @override
  _BeforeHomePageState createState() => _BeforeHomePageState();
}

class _BeforeHomePageState extends State<BeforeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/homepage"),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      width: 300,
                      child: Text(
                        "Day View",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/monthView"),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      width: 300,
                      child: Text(
                        "Month View",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/quarterView"),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      width: 300,
                      child: Text(
                        "Quarter View",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/yearView"),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      width: 300,
                      child: Text(
                        "Year View",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
