import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                Page1(),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              final Tween<Offset> offsetTween = Tween<Offset>(
                  begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0));
              final Animation<Offset> slideOutLeftAnimation =
                  offsetTween.animate(secondaryAnimation);
              return SlideTransition(
                  position: slideOutLeftAnimation, child: child);
            },
          );
        }
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder<dynamic>(
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    Page2(),
                transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) {
                  final Tween<Offset> offsetTween = Tween<Offset>(
                      begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0));
                  final Animation<Offset> slideInFromTheRightAnimation =
                      offsetTween.animate(animation);
                  return SlideTransition(
                      position: slideInFromTheRightAnimation, child: child);
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              'На экран 2',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              'На экран 1',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
