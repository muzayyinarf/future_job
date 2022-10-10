part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController goalController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: redColor, content: Text(message)));
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up Page',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Begin New Journey',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputImage() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xff2A327D),
                child: CircleAvatar(
                  radius: 58,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 51,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: nameController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: '',
              ),
              style: purpleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: emailController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: EmailValidator.validate(emailController.text)
                        ? primaryColor
                        : Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: '',
              ),
              style: EmailValidator.validate(emailController.text)
                  ? purpleTextStyle
                  : redTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: primaryColor,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: '',
              ),
              style: purpleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputGoal() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Goal',
            style: titleTextStyle,
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: goalController,
            cursorColor: primaryColor,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
              fillColor: Color(0xffF1F0F5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: '',
            ),
            style: purpleTextStyle,
          ),
        ],
      );
    }

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width - 2 * 24,
        height: 45,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TextButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      goalController.text.isEmpty) {
                    showError('Semua fields harus diisi!!');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel? user = await authProvider.register(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        goalController.text);
                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email sudah terdaftar');
                    } else {
                      userProvider.user = user;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    }
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff4141A4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(66))),
                child: Text(
                  'Sign Up',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              'Back To Sign In',
              style: greyTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            children: [
              header(),
              inputImage(),
              inputName(),
              inputEmail(),
              inputPassword(),
              inputGoal(),
              signUpButton(),
              signInButton()
            ],
          ),
        ),
      ),
    );
  }
}
