
import 'package:flutter/material.dart';
import './HomeListView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var day = '';
  var month = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var today = DateTime.now();
    var monthMap = {
      '1':'一',
      '2':'二',
      '3':'三',
      '4':'四',
      '5':'五',
      '6':'六',
      '7':'七',
      '8':'八',
      '9':'九',
      '10':'十',
      '11':'十一',
      '12':'十二',
    };
    setState(() {
      day = today.day.toString();
      month = monthMap[today.month.toString()]+'月';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('知乎日报'),
        centerTitle: false,
        leading: Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Column(
              children: <Widget>[
                Text(day,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                Text(month),
              ],
            ),
            Container(child: null,decoration: BoxDecoration(color:Colors.black),width: 0.5,height: 40,
            margin: EdgeInsets.fromLTRB(10 , 0, 0, 0),),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: null, 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage('https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3240503161,880923163&fm=26&gp=0.jpg'),
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                ),
            ),
            color: Colors.black38,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: HomeListView())
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
