import 'package:adapter_pattern_error_manage/home/core/social_adapter.dart';
import 'package:adapter_pattern_error_manage/home/core/social_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Social View'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                adapter: FacebookAdapter(),
                onComplete: (token) {
                  print(token);
                },
              ),
              SocialButton(
                adapter: GoogleAdapter(),
                onComplete: (token) {
                   print(token);
                },
              ),
              SocialButton(
                adapter: AppleAdapter(),
                onComplete: (token) {
                   print(token);
                },
              ),
            ],
          ),
        ));
  }
}
