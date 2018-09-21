import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  initialRoute: '/',
  routes: {
    // Declare  '/' is first screen
    '/' : (context) => FirstScreen(),
    '/second' :(context)  => SecondScreen(nameToShow: FirstScreen._name_to_show_controller.text,)

  },

 ));



class FirstScreen extends StatelessWidget {

  static final _name_to_show_controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter Your Name'),
                controller: _name_to_show_controller,),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/second');
                },
                child: Text('Go '),
              )
            ],),
        ));
  }
}
class SecondScreen extends StatelessWidget {

  final nameToShow;

  SecondScreen({Key key,@required this.nameToShow}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello $nameToShow'),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              )
            ],),
        ));
  }
}
