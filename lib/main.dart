import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login App",
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceIn
    );

    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/shifu.png"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    accentColor: Colors.tealAccent,
                    primarySwatch: Colors.teal,
                    brightness: Brightness.dark
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(30.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Email"
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Password"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: new EdgeInsets.all(20.0),
                          child: new MaterialButton(
                            color: Colors.white24,
                            textColor: Colors.white,
                            splashColor: Colors.blueGrey,
                            onPressed: null,
                            child: new Icon(Icons.keyboard_arrow_right),
                          ),
                        )
                      ],
                    )
                  )
                )
              )
            ],
          )
        ],
      ),
    );
  }
}