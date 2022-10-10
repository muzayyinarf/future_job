part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();

    
    Timer(Duration(seconds: 1), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4141A4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 59,
                height: 76,
              ),
              SizedBox(height: 50),
              Text(
                'FUTUREJOB',
                style: splashTextStyle
              )
            ],
          ),
        ));
  }
}
