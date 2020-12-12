import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30),
              CounterWidget(
                onPrssed: () {
                  print("========object");
                },
                increment: (value) {
                  print(value);
                  setState(() {
                    _counter = _counter + value;
                  });
                },
                decrement: (value) {
                  print(value);
                  setState(() {
                    _counter = _counter - value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

typedef MyCustomCallback(int);

class CounterWidget extends StatefulWidget {
  final VoidCallback onPrssed;
  final MyCustomCallback increment;
  final MyCustomCallback decrement;

  const CounterWidget(
      {Key key,
      @required this.onPrssed,
      @required this.increment,
      @required this.decrement})
      : super(key: key);
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.onPrssed();
          },
          child: Text("A counter Widget"),
        ),
        FloatingActionButton(
          onPressed: () => widget.increment(2),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => widget.decrement(2),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
