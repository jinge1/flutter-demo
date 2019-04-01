import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart' show AssetImage;

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() => runApp(
  App()
);

class App extends StatelessWidget{
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    '/': (context) => HomePage('in home page'),
    '/login': (context) => LoginPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello word',
      color: Colors.red,
      theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      routes: _routes,
      initialRoute: '/'
    );
  }
}

class HomePage extends StatelessWidget{
  final String title;
  HomePage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('HomePage $title'),
        elevation: 0,
      ),
      body: new ListView(
        children: [
          Container(
            child: Row(children: <Widget>[
              Image.asset("assets/black.png"),
              Container(
                child: Column(children: <Widget>[
                  Container(
                    child: Text(
                      'Widget', 
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24.0
                      ),
                    ),
                    padding: EdgeInsets.only(top:0, right: 10.0, bottom: 0, left: 10.0),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      'Widget是临时对象，用于构建当前状态下的应用程序，而State对象在多次调用build()之间保持不变',
                      softWrap: true,
                      maxLines: 6
                    ),
                  )
                ])
              ),
            ]),
            padding: EdgeInsets.only(top:10.0, bottom: 10.0, right: 10.0, left: 10.0),
          ),

          Container(
            child: IconButton(            //发送按钮
              icon: Text('to login'),
              onPressed: ()=> {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                )
              }
            )
          )
        ]
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
  bool isMobile = false;
  final RegExp mobileReg = new RegExp(r"(1\d{10})");

  final formSection = FormSection();
  void _login(){
    String text = formSection.getController().text;
    bool isMatch = mobileReg.hasMatch(text);
    setState(()=> isMobile = isMatch);
    if(isMatch){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage('from login')),
      );
    }else{
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text('错误提示！'),
              content: new SingleChildScrollView(
                child: Text('手机号格式输入有误'),
              ),
              actions: <Widget>[
                  new FlatButton(
                      child: new Text('确定'),
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                  ),
              ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('login')
      ),
      body: ListView(
        children: [
          Image.asset("assets/top_img.png"),
          formSection,
          Text("is ${isMobile ? 'right' : 'wrong'}"),
          RaisedButton(
            onPressed: _login,
            child: Text('登录'),
          )
        ]
      ), 
    );
  }
}

class FormSection extends StatelessWidget{
  final _textController = TextEditingController();
  getController(){
    return _textController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          contentPadding: EdgeInsets.all(10.0),
          labelText: '请输入手机号码',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          )
        ),
        controller: _textController
      ),
      padding: EdgeInsets.only(top:20.0, bottom: 20.0, right: 20.0, left: 20.0),
    );
  }
}
