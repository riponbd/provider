import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyData extends ChangeNotifier {
  int counter = 0;
  incrementCounter() {
    counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider.value(
        value: MyData(),
        child: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<MyData>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Provider",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                providerdata.counter.toString(),
                style: TextStyle(fontSize: 50),
              ),
              RaisedButton(onPressed: () {
                providerdata.incrementCounter();
              })
            ],
          ),
        ),
      ),
    );
  }
}
