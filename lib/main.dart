import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyWinApp());
  doWhenWindowReady(() {
    final win = appWindow;
    // final initialSize = Size(600, 450);
    final initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

class MyWinApp extends StatelessWidget {
  const MyWinApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /* theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ), */
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          body: WindowBorder(
            color: borderColor,
            width: 1,
            child: Row(
              children: const [LeftSide(), RightSide()],
            ),
          ),
        ));
  }
}

const borderColor = Color.fromARGB(255, 155, 62, 0);
const sidebarColor = Color(0xFFF6A00C);
const backgroundStartColor = Color(0xFFFFD500);
const backgroundEndColor = Color(0xFFF6A00C);

/* var buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFFB65902),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFFB65902),
  iconMouseOver: const Color(0xFFB65902),
  iconMouseDown: const Color(0xFFFFD500),
  normal: const Color(0xFFF6A00C),
); */

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

//!------------------
class LeftSide extends StatelessWidget {
  const LeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        color: sidebarColor,
        /*  decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          color: sidebarColor,
        ), */
        child: Column(
          children: [
            WindowTitleBarBox(
              //! - Allow to move appBar
              child: MoveWindow(),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

//!------------------
class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundStartColor, backgroundEndColor],
                  stops: [0.0, 1.0]),
            ),
            child: Column(children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                      //! - Allow to move appBar
                      child: MoveWindow(),
                    ),
                    const WindowButtons()
                  ],
                ),
              ),
            ])));
  }
}

//!------------------
class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors,
          animate: true,
        ),
        MaximizeWindowButton(
          colors: buttonColors,
          animate: true,
        ),
        CloseWindowButton(
          animate: true,
        ),
      ],
    );
  }
}
