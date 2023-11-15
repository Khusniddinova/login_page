import 'package:flutter/material.dart';
import 'dart:ui' as ui;

// import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showFirstImage = true;
  IconData currentIcon = Icons.lock_outline;
  bool isLoggedIn = false;

  void updateIcon() {
    setState(() {
      if (isLoggedIn) {
        currentIcon = Icons.lock_outline;
      } else {
        currentIcon = Icons.login;
      }
      isLoggedIn = !isLoggedIn;
    });
  }

  void toggleImage() {
    setState(() {
      showFirstImage = !showFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    currentIcon,
                    size: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    isLoggedIn ? 'sign in' : 'sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        // Call the function to toggle images
                        toggleImage();
                        updateIcon();
                      },
                      child: Text('click'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          fixedSize: const Size(300, 50)),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (showFirstImage)
                            Image.asset(
                              'image/insta.png',
                              height: 100,
                              width: 100,
                            )
                          else
                            Image.asset(
                              'image/meta1.png',
                              height: 100,
                              width: 100,
                            ),
                          if (showFirstImage)
                            Image.asset(
                              'image/meta1.png',
                              height: 100,
                              width: 100,
                            )
                          else
                            Image.asset(
                              'image/insta.png',
                              height: 100,
                              width: 100,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
