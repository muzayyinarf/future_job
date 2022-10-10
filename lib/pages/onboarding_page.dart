part of 'pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
      );
    }

    Widget content() {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Build Your Next\nFuture Career Like\na Master',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '18,000 jobs available',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 2 * 80,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                          color: Color(0xff4141A4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66))),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 2 * 80,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66),
                            side: BorderSide(color: Colors.white, width: 1))),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          content(),
        ],
      ),
    );
  }
}
