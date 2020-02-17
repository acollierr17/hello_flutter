import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() => runApp(SimpleCounter());

class SimpleCounter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Counter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange
      ),
      home: MyHomePage(title: 'Simple Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  void _incrementCounterBy10() {
   setState(() {
     _counter += 10;
   });
  }

  void _decrementCounterBy10() {
    setState(() {
      _counter -= 10;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showAboutDeveloper() {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle = themeData.textTheme.body2.copyWith(color: themeData.accentColor);
    
    final String repoURL = 'https://github.com/acollierr17/hello_flutter';
    final String discordInvite = 'https://discord.gg/g7wr8xb';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Simple Counter v0.1'),
          content: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Designed & developed by ',
                    style: aboutTextStyle
                  ),
                  TextSpan(
                    text: 'Anthony Collier',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: aboutTextStyle.fontSize,
                      color: aboutTextStyle.color
                    )
                  ),
                  TextSpan(
                    text: '.\n\n',
                    style: aboutTextStyle
                  ),
                  TextSpan(
                    text: 'GitHub ',
                    style: linkStyle,
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => launcher.launch(repoURL)
                  ),
                  TextSpan(
                    text: '| ',
                    style: aboutTextStyle,
                  ),
                  TextSpan(
                    text: 'Discord ',
                    style: linkStyle,
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => launcher.launch(discordInvite)
                  ),
                ]
              )
            ),
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var scaffold = Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: _showAboutDeveloper,
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // 'Tap the buttons below to change the counter',
              'Made with ❤ by Anthony',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            _counterText(context)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // So if we press down on 'Inc' or 'Dec' buttons, then the _counter variable will increase/decrease by 10
              GestureDetector(
                onLongPress: () {
                  // print('Long press has been made to decrement!');
                  _decrementCounterBy10();
                },
                child: FloatingActionButton.extended(
                  onPressed: _decrementCounter,
                  // tooltip: 'Decrement',
                  icon: Icon(Icons.remove),
                  label: Text('Dec'),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: _resetCounter,
                // tooltip: 'Reset',
                icon: Icon(Icons.delete_forever),
                label: Text('Clear'),
              ),
              GestureDetector(
                onLongPress: () {
                  // print('Long press has been made to increment!');
                  _incrementCounterBy10();
                },
                child: FloatingActionButton.extended(
                  onPressed: _incrementCounter,
                  // tooltip: 'Increment',
                  icon: Icon(Icons.add),
                  label: Text('Inc'),
                )
              ),
            ],
          ),
        )
    );
    return scaffold;
  }

  Widget _counterText(BuildContext context) {
    /**
     * Basically I want to check if a number is divisible by 10 (we're excluding 0)
     * If so, do some cool shit?
     */
    if ((_counter % 10 == 0) && (_counter != 0)) {
      // print('Hey! $_counter is divisible by 10!');
      return Text(
        _counter.toString(),
        style: TextStyle(
          fontSize: 210,
          color: Colors.lightBlue
        )
      );
    }

    if (_counter < 0) {
      return Text(
        _counter.toString(),
        style: TextStyle(
          fontSize: 170,
          color: Colors.red
        )
      );
    } else if (_counter > 0) {
      return Text(
        _counter.toString(),
        style: TextStyle(
          fontSize: 170,
          color: Colors.green
        )
      );
    } else {
      return Text(
        _counter.toString(),
        style: TextStyle(
          fontSize: 170,
        )
      );
    }
  }
}
