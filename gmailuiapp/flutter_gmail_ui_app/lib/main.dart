import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Material(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search Mail",
                        border: InputBorder.none,
                        icon: Icon(Icons.dehaze_outlined),
                        suffixIcon: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: CircleAvatar(
                                child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            )))),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    List.generate(getEmailList().length, (index) {
              final item = getEmailList()[index];
              return !item.isTopItem ? _normalItem(item) : _topItem(item);
            })))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.red,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<EmailModel> getEmailList() {
    return [
      EmailModel(
          Icon(
            Icons.people_outline_rounded,
            color: Colors.blue,
          ),
          "Social",
          "Youtube",
          null,
          null,
          true),
      EmailModel(
          Icon(
            Icons.tag,
            color: Colors.green,
          ),
          "Promotions",
          "Think with Google",
          null,
          null,
          true),
      EmailModel(
          Icon(
            Icons.forum_outlined,
            color: Colors.purple,
          ),
          "Forum",
          "Google Play",
          null,
          null,
          true),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false,
          true),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false),
      EmailModel(
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          "Email subject ",
          "Email body goes here, Please subscribe to our channel!!",
          "Name ",
          "10:00 Am",
          false,
          true),
    ];
  }

  _topItem(EmailModel item) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 24, right: 16),
      tileColor: Colors.white,
      leading: item.icon,
      title: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.subject,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              item.body,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
            color: item.icon.color,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Text(
          "12 new",
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _normalItem(EmailModel item) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 8),
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: item.icon,
      ),
      title: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.from,
                  style: TextStyle(
                      color: item.isRead ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item.time,
                  style: TextStyle(
                      color: item.isRead ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              item.subject,
              style: TextStyle(
                  color: item.isRead ? Colors.grey : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.body,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Icon(Icons.star_border_outlined, color: Colors.grey,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EmailModel {
  final Icon icon;
  final String subject;
  final String body;
  final String from;
  final String time;
  final bool isTopItem;
  final bool isRead;

  EmailModel(
      this.icon, this.subject, this.body, this.from, this.time, this.isTopItem,
      [this.isRead = false]);
}
