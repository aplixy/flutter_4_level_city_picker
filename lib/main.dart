import 'package:flutter/material.dart';
import 'package:fluttercitypickerdemo/city_picker/modal/result.dart';
import 'package:fluttercitypickerdemo/city_picker/src/city_picker.dart';
import 'package:fluttercitypickerdemo/city_picker/src/show_types.dart';
import 'package:fluttercitypickerdemo/meta/province.dart';
import 'package:fluttercitypickerdemo/meta/province_gd.dart';
import 'package:fluttercitypickerdemo/meta/province_nm.dart';

void main() => runApp(MyApp());

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

  bool customerMeta = true;
  double customerItemExtent = 40;
  bool customerButtons = false;
  bool customerItemBuilder = false;
  Result result = new Result();

  getItemBuilder() {
    if (customerItemBuilder) {
      return (item, list, index) {
        return Center(
            child: Text(item, maxLines: 1, style: TextStyle(fontSize: 55)));
      };
    } else {
      return null;
    }
  }


  void _incrementCounter() async {

    Result tempResult = await CityPickers.showCityPicker(
        context: context,
        theme: null,
        locationCode: null,
        showType: ShowType.pcav,
        isSort: false,
        barrierOpacity: 0.5,
        barrierDismissible: false,
        citiesData: customerMeta == true ? citiesDataNm : null,
        provincesData: customerMeta == true ? provincesDataNm : null,
        itemExtent: customerItemExtent,
        cancelWidget: customerButtons ? Text('cancle') : null,
        confirmWidget: customerButtons ? Text('confirm') : null,
        itemBuilder: this.getItemBuilder());
    if (tempResult == null) {
      return;
    }
    this.setState(() {
      result = tempResult;
    });


//    setState(() {
//      _counter++;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
            Text(
              '${result.toString()}',
              //style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
