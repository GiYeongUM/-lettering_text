import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettering_text/kr_text_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool isOn;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    isOn = false;
    _showIcon();
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
    setState(() {
      isOn = true;
    });
  }

  void _reverseIcon() {
    _animationController.reverse();
    setState(() {
      isOn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: (){
                  isOn ? _reverseIcon() : _showIcon();

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "가",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "나",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "다",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "라",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "마",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "바",
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

