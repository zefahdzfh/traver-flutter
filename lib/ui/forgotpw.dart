// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/controller/authController.dart';

class Forgot extends StatefulWidget {
  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  saveForgot() {
    loading = true;
    AuthController().forgotProses(email.text).then((value) {
      if (value != null) {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Login Berhasil",
          dialogType: DialogType.success,
          btnOkOnPress: () => Navigator.pushNamedAndRemoveUntil(
            context,
            "/login",
            (route) => false,
          ),
        ).show();
      } else {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Failed",
          desc: "Login Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/img/traver.png',
                width: 300,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                saveForgot();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(screenWidth - 32, 75),
              ),
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // _buildSocialMediaButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: email,
        decoration: InputDecoration(
          hintText: 'Email',
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.yellow))
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: password,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: 'Password',
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.yellow)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            child: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        Text(
          'Remember Me',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(onPressed: () {}, child: Text('Forgot password', style: TextStyle(color: Colors.grey)))
      ],
    );
  }

  Widget _buildCreateAccountButton(double screenWidth, double height) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(screenWidth - 32, 75),
      ),
      child: Text(
        'Create Account',
        style: GoogleFonts.poppins(fontSize: 18),
      ),
    );
  }

  Widget _buildLoginAccountButton(double screenWidth, double height) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(screenWidth - 32, 75),
      ),
      child: Text(
        'Sign In',
        style: GoogleFonts.poppins(fontSize: 18),
      ),
    );
  }

  Widget _buildSocialMediaButtons() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSocialMediaButton('assets/img/ig.png', 'Instagram'),
          _buildSocialMediaButton('assets/img/google.png', 'Google'),
          _buildSocialMediaButton('assets/img/fb.png', 'Facebook'),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton(String imagePath, String platform) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
