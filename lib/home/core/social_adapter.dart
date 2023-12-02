// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class SocailAdapter {
  Future<String?> make();
  SocialAdapterModel get model;
}

class SocialAdapterModel {
  final String title;
  final Color bcolor;
  final Color fcolor;
  final IconData icon;

  SocialAdapterModel({
    required this.title,
    required this.bcolor,
    required this.fcolor,
    required this.icon,
  });
  factory SocialAdapterModel.facebook() => SocialAdapterModel(
        title: 'Facebook',
        icon: Icons.facebook,
        bcolor: const Color(0xff3B5998),
        fcolor: Colors.white,
      );
  factory SocialAdapterModel.google() => SocialAdapterModel(
        title: 'Google',
        icon: Icons.g_mobiledata,
        bcolor: const Color(0xffdd4839),
        fcolor: Colors.white,
      );
  factory SocialAdapterModel.apple() => SocialAdapterModel(
        title: 'Apple',
        icon: Icons.apple,
        bcolor: Colors.black,
        fcolor: Colors.white,
      );
}

class FacebookAdapter implements SocailAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.facebook();
}

class GoogleAdapter implements SocailAdapter {
  @override
  Future<String?> make() async {
    // try exception :|
    throw Exception('Google is not supported this device $this');
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.google();
}

class AppleAdapter implements SocailAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.apple();
}
