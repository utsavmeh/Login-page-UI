import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Fun(),
    );
  }
}

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.decelerate);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login", textAlign: TextAlign.center,),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/download.jpg"), fit: BoxFit.cover,
          color: Colors.black54,colorBlendMode: BlendMode.darken,),
          Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: _iconAnimation.value * 100,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        labelStyle:
                            TextStyle(color: Colors.teal, fontSize: 22.0, fontStyle: FontStyle.italic),
                        hintText: "Your@email.com",
                        hintStyle: TextStyle(color: Colors.lime, fontSize: 15.0)
                      ),
                    ),
                  ),
                  Container(
//            color: Colors.teal,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle:
                            TextStyle(color: Colors.teal, fontSize: 22.0, fontStyle: FontStyle.italic),
                        hintText: "",
                      ),
                    ),
                  ),
                  MaterialButton(padding: EdgeInsets.all(5.0),
                    color: Colors.grey,
                    child: Text("Login", style: TextStyle(color: Colors.white,backgroundColor: Colors.grey),),
                    onPressed: () {
//                    TODO: Create Login Task
                    },
                  ),
                  MaterialButton(padding: EdgeInsets.all(5.0),
                    child: Text("SignUp", style: TextStyle(color: Colors.white),),
                    onPressed: () {
//                    TODO: Create Login Task
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
