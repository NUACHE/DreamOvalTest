import 'package:deip/core/theme/app_colors.dart';
import 'package:deip/core/widgets/brand_buttons.dart';
import 'package:deip/core/widgets/brand_dialogs.dart';
import 'package:deip/core/widgets/brand_textfield.dart';
import 'package:deip/features/auth/services/login_services.dart';
import 'package:deip/features/home/views/home.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool usernameError = false;
  bool passwordError = false;
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please enter basic authentication username and password to proceed',
                    style: TextStyle(
                        fontSize: 2.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Username'),
              ),
              BrandTextBox(
                name: 'Username',
                controller: usernameController,
                errorMessage: 'Invalid username',
                error: usernameError,
                boxColor: AppColors.baseBlue,
              ),
              SizedBox(
                height: 4.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Password'),
              ),
              BrandTextBox(
                name: 'Password',
                controller: passwordController,
                errorMessage: 'Invalid password',
                obScure: passwordObscure,
                error: passwordError,
                boxColor: AppColors.baseBlue,
                testWidget: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordObscure = !passwordObscure;
                    });
                  },
                  icon: Icon(
                    passwordObscure == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: BrandButton(
                  color: AppColors.baseBlue,
                  title: 'Sign In',
                  titleColor: Colors.white,
                  function: () async {
                    if (usernameController.text.isEmpty) {
                      setState(() {
                        usernameError = true;
                      });
                    } else if (usernameController.text.isNotEmpty) {
                      setState(() {
                        usernameError = false;
                      });
                    }
                    if (passwordController.text.isEmpty) {
                      setState(() {
                        passwordError = true;
                      });
                    } else if (passwordController.text.isNotEmpty) {
                      passwordError = false;
                    }
                    if (usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      setState(() {
                        usernameError = false;
                        passwordError = false;
                      });
                      showLoading(context);
                      var resp = await LoginServices().fetchCollections(
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                      if (mounted) {}
                      Navigator.pop(context);

                      if (resp['status'].toString() == 'true') {
                        if (mounted) {}
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(
                              data: resp['data'],
                            ),
                          ),
                        );
                      } else {
                        if (mounted) {}
                        showFlushAlert(
                          context,
                          'Something went wrong',
                          bgColor: Colors.red,
                        );
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
