import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/components/custom_text_form_field.dart';
import 'package:tasky/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/logo.svg', height: 42, width: 42),
                    SizedBox(width: 16),
                    Text("Tasky", style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
                SizedBox(height: 118),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To Tasky ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SvgPicture.asset('assets/images/waving_hand.svg'),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Your productivity journey starts here.",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16),
                ),
                SizedBox(height: 24),
                SvgPicture.asset('assets/images/welcome.svg', width: 215, height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),

                      CustomTextFormField(
                        hintText: 'e.g. Sarah Khalid',
                        title: 'Full Name',
                        controller: controller,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width, 40),
                        ),
                        onPressed: () async {
                          if (_key.currentState?.validate() ?? false) {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setString('username', controller.text);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          }
                        },
                        child: Text("Let’s Get Started"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
