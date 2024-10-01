// ignore_for_file: deprecated_member_use, unused_field, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/controller/authController.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasiPassword = TextEditingController();

  bool loading = false;
  saveRegis() {
    loading = true;
    AuthController()
        .registerProses(
      name.text,
      email.text,
      password.text,
      konfirmasiPassword.text,
    )
        .then((value) {
      if (value != null) {
        loading = false;
        AwesomeDialog(
          context: context,
          title: "Success",
          desc: "Register Berhasil",
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
          desc: "Register Gagal",
          dialogType: DialogType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    var tinggi = MediaQuery.of(context).size.height;

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
            _buildNameTextField(),
            SizedBox(
              height: 20,
            ),
            _buildEmailTextField(),
            SizedBox(
              height: 20,
            ),
            _buildPasswordTextField(),
            SizedBox(
              height: 20,
            ),
            _buildConfernPasswordTextField(),
            SizedBox(
              height: 40,
            ),
            _buildBackToLoginButton(lebar, 50),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                saveRegis();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(lebar - 32, 75),
              ),
              child: Text(
                'Sign Up',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return TextField(
      controller: name,
      decoration: InputDecoration(
        hintText: 'Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.yellow)),
        
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: email,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.yellow)),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: password,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.yellow)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          child: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildConfernPasswordTextField() {
    return TextField(
      controller: konfirmasiPassword,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'konfirmasi password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.yellow)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          child: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey
          ),
        ),
      ),
    );
  }

  Widget _buildBackToLoginButton(double lebar, double tinggi) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(lebar - 32, 75),
      ),
      child: Text(
                'Kembali ke Login',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
    );
  }

  Widget _buildSubmitButton(double lebar, double tinggi) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Color.fromARGB(255, 252, 211, 64))),
        onPressed: () => saveRegis(),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Text("Submit",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))));
  }
}
