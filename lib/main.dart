import 'package:flutter/material.dart';
import 'package:resize_tablet/resize.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        ///add [BuilderMaterialApp.resizeTablet] in builder attribute for this to work
        builder: BuilderMaterialApp.resizeTablet,
        title: 'Material App',
        home: PageExample1(),
      ),
    );
  }
}

class PageExample1 extends StatelessWidget {
  const PageExample1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YellowPage(),
                  ),
                );
              },
              child: Container(
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Text('Tap me to navigate yellow screen'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GreenPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.blueAccent, width: 20)),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Text('Tap me to navigate green screen'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GreenPage extends StatelessWidget {
  const GreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Container(
            child: Text('Tap me to return'),
          ),
        ),
      ),
    );
  }
}

class YellowPage extends StatelessWidget {
  const YellowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Container(
            child: Text('Tap me to return'),
          ),
        ),
      ),
    );
  }
}
