import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/core/component/text_form_field.dart';
import 'package:task2/home_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Vector.png',
                        width: 42,
                        height: 42,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Tasky',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To Tasky',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 10),
                      Image.asset('assets/images/wave.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your productivity journey starts here',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/pana.png",
                    width: 215,
                    height: 204.39,
                  ),
                  SizedBox(height: 30),
                ],
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TextFormFieldComponent(
                        name: 'Full Name',
                        title: 'eg Mahmoud Shrief',
                        controller: _controller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState?.validate() ?? false) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('username', _controller.text.trim());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TaskPage()),
                        );
                      }
                    },
                    child: Text(
                      'Let’s Get Started',
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
