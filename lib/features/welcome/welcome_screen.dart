import 'package:flutter/material.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/perefernces_manager.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/core/widgets/text_form_field.dart';
import 'package:tasky/features/navigation/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomSvgPicture.withoutColor(
                        path: 'assets/images/logo.svg',
                        height: 42,
                        width: 42,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Tasky",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 118),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To Tasky ",
                        style: theme.displaySmall,
                      ),
                      const CustomSvgPicture.withoutColor(path: "assets/images/waving_hand.svg"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your productivity journey starts here.",
                    style: theme.displaySmall!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const CustomSvgPicture.withoutColor(
                    path: 'assets/images/welcome.svg',
                    width: 215,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          controller: controller,
                          hintText: 'e.g. Sarah Khalid',
                          title: "Full Name",
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please Enter Your Full Name ";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(MediaQuery.of(context).size.width, 40),
                          ),
                          onPressed: () async {
                            if (_key.currentState?.validate() ?? false) {
                              // ممكن تحفظ البيانات في Isolate أو background إذا كان معقد
                              await PereferncesManager().setString(StorageKey.username, controller.text);

                              if (!mounted) return; // لو الشاشة اتقفلت اثناء الانتظار

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Enter Your Full Name"),
                                ),
                              );
                            }
                          },
                          child: const Text("Let’s Get Started"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
