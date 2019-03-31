import 'package:flutter/material.dart';


void main() => runApp(
  App()
);

class App extends StatelessWidget{
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => HomePage(title: 'hello app'),
    '/login': (context) => LoginPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello word',
      color: Colors.orange,
      routes: _routes,
      initialRoute: '/'
    );
  }
}

class HomePage extends StatelessWidget{
  HomePage({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('what happended $title')
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Row(
          children: [
            Text(
              'hello2',
              style:TextStyle(
                fontSize: 24.0,
                color: Colors.orange
              )
            ),
            IconButton(            //发送按钮
              icon: Text('click'),
              onPressed: ()=> {
                 Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                )
              }
            )
          ]
        )
      )
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State {
  // final TextEditingController _textController = TextEditingController();

  String mobile = '15888888888';
  // void _handleSubmitted(String text){
  //   setState(()=> mobile = text);
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('login')
      ),
      backgroundColor: Colors.green,
      body: TextField()
    );
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       return new Container(
        child: new Text(
          'hello',
          style: new TextStyle(
            fontSize: 24.0,
            color:Colors.orange
          )
        ),
        width: 320.0,
        height: 320.0,
        padding: const EdgeInsets.only(top:100.0),
        color: Colors.blue
    );
  
  }

  
}