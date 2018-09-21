import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                
                  startScreenAndGetResult(context);
                },
                child: Text('Go '),
              )
            ],),
        ));
  }

  void startScreenAndGetResult(BuildContext context) async{
    
    final result = await Navigator.pushNamed(context, '/second'
    );
    //show result
    Fluttertoast.showToast(msg:result,
      toastLength:Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      bgcolor: '#000000',
      textcolor: '#ffffff');
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

              //Add Row and add 2 button to this row
              Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

                //Add Raise Button with padding
                Padding(padding: const EdgeInsets.all(8.0),child: RaisedButton(onPressed: (){

                  Navigator.pop(context,"How Are You ?");

                },child: Text('Continue Taking '),),
              ),

                Padding(padding: const EdgeInsets.all(8.0),child: RaisedButton(onPressed: (){

                  Navigator.pop(context," Good bye ");

                  },child: Text('Stop Taking '),),
                ),

              ],),

            ],),
        )
    );


  }
}
