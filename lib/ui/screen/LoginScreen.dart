import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/Data/Models/auth_utility.dart';
import 'package:m_11_addtask_project/Data/Models/login_model.dart';
import 'package:m_11_addtask_project/Data/Models/response_object.dart';
import 'package:m_11_addtask_project/Data/Utils/urls.dart';
import 'package:m_11_addtask_project/Data/services/network_caller.dart';
import 'package:m_11_addtask_project/ui/screen/email_varification_screen.dart';
import 'package:m_11_addtask_project/ui/widgets/screen_background.dart';
import 'create_account_screen.dart';
import 'bottom_nav_base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTeController = TextEditingController();
  final TextEditingController _passwordTeController = TextEditingController();

  bool _loginProgress = false;

  Future<void> login() async {
    _loginProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestbody = {
      "email": _emailTeController.text.trim(),
      "password": _passwordTeController.text
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, requestbody);
    _loginProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBaseScreen()),
            (route) => false);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Incorrect email or password')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 64,
                ),
                Text(
                  'Get Started With',
                  /*style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
               */
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _emailTeController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: _passwordTeController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _loginProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVarificationScreen()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, letterSpacing: 0.4),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: Text('Sign up'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
