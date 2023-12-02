import 'package:adapter_pattern_error_manage/home/core/social_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.adapter, required this.onComplete});
  final SocailAdapter adapter;
  final void Function(String? token) onComplete;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        /* final response = await adapter.make.call();
       
        if (response == null || response.isEmpty) {
          throw Exception('$this data is null $response');
        }
           onComplete.call(response);*/

        final response2 = await GlobalException.make<String?>(adapter.make);
        if (response2 == null || response2.isEmpty) {
          //push to login view
          return;
        }

        onComplete.call(response2);
      },
      icon: Icon(adapter.model.icon),
      label: Text(adapter.model.title),
      style: ElevatedButton.styleFrom(
          foregroundColor: adapter.model.fcolor,
          backgroundColor: adapter.model.bcolor),
    );
  }
}

class GlobalException {
  static Future<T?> make<T>(AsyncValueGetter<T> onOperation) async {
    try {
      final response = await onOperation.call();
      if (response == null) {
        throw Exception('$T data is null $response');
      }

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
