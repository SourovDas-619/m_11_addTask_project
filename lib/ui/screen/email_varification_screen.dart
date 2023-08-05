import 'package:flutter/material.dart';
import 'package:m_11_addtask_project/ui/widgets/screen_background.dart';
import 'pin_varification_screen.dart';
class EmailVarificationScreen extends StatelessWidget {
  const EmailVarificationScreen({super.key});

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
                  SizedBox(height: 64,),
                  Text(
                    'Your Email Address',
                    /*style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                 */
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4,),
                  Text('A 6 digit verification pin will sent to your email address',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey
                  )
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PinScreen()));
                        }, child: Icon(Icons.arrow_circle_right_outlined)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, letterSpacing: 0.4),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('Sign in'))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
