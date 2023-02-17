import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _slidingValue = 0;
  bool showPassword = false;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isNumber = false;
  bool isLength = false;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 250,
            height: 50,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFFDDF1EE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _slidingValue = 0;
                        pageController.jumpToPage(0);
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _slidingValue == 0
                            ? const Color(0xFF20BEAD)
                            : const Color(0xFFDDF1EE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: _slidingValue == 0
                                ? Colors.white
                                : Colors.black38,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _slidingValue = 1;
                        pageController.jumpToPage(1);
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _slidingValue == 1
                            ? const Color(0xFF20BEAD)
                            : const Color(0xFFDDF1EE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: _slidingValue == 1
                                ? Colors.white
                                : Colors.black38,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _slidingValue = value;
                });
              },
              controller: pageController,
              children: [
                _signUpUi(context),
                _signInUi(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _signUpUi(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(left: 20),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    helperStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(right: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    helperStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(left: 20, right: 10),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Email Address',
              helperStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(left: 20, right: 10),
          child: TextField(
            obscureText: !showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              helperStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash,
                  color: Colors.grey,
                ),
              ),
            ),
            onChanged: (value) {
              if (RegExp(r'[A-Z]').hasMatch(value)) {
                isUpperCase = true;
              }
              if (RegExp(r'[a-z]').hasMatch(value)) {
                isLowerCase = true;
              }
              if (RegExp(r'[0-9]').hasMatch(value)) {
                isNumber = true;
              }
              if (value.length > 8) {
                isLength = true;
              }
              setState(() {});
            },
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
          child: Text(
            "Password Should Contains with Bellow conditions",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 10),
          child: Row(
            children: [
              Container(
                height: 15.0,
                width: 15.0,
                decoration: BoxDecoration(
                  color: isUpperCase ? Colors.green : Colors.black38,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Contains at least one UpperCase character",
                style: TextStyle(
                  color: isUpperCase ? Colors.green : Colors.black38,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: Row(
            children: [
              Container(
                height: 15.0,
                width: 15.0,
                decoration: BoxDecoration(
                  color: isLowerCase ? Colors.green : Colors.black38,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Contains at least one LowerCase character",
                style: TextStyle(
                  color: isLowerCase ? Colors.green : Colors.black38,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: Row(
            children: [
              Container(
                height: 15.0,
                width: 15.0,
                decoration: BoxDecoration(
                  color: isNumber ? Colors.green : Colors.black38,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Contains at least one Number",
                style: TextStyle(
                  color: isNumber ? Colors.green : Colors.black38,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: CupertinoButton(
            onPressed: () {},
            color: const Color(0xFF20BEAD),
            child: const Text("Let's Go"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            onPressed: () {},
            label: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Sign Up With Google",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            icon: const Icon(
              FontAwesomeIcons.google,
              color: Colors.blueAccent,
            ),
          ),
        )
      ],
    );
  }

  Column _signInUi(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin:
              const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF20BEAD).withOpacity(.3),
                spreadRadius: 5,
                offset: const Offset(2, 2),
                blurRadius: 5,
              )
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Email Address',
              helperStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(left: 20, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF20BEAD).withOpacity(.3),
                spreadRadius: 5,
                offset: const Offset(2, 2),
                blurRadius: 5,
              )
            ],
          ),
          child: TextField(
            obscureText: !showPassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Password',
              helperStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgote Passowrd?",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: CupertinoButton(
            onPressed: () {},
            color: const Color(0xFF20BEAD),
            child: const Text("Log In"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            onPressed: () {},
            label: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Sign In With Google",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            icon: const Icon(
              FontAwesomeIcons.google,
              color: Colors.blueAccent,
            ),
          ),
        )
      ],
    );
  }
}
