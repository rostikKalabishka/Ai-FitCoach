import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.radius,
    this.width,
    this.height,
    required this.isUser,
  });

  final bool isUser;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: SizedBox.expand(
          child: Image.asset(
            isUser ? AppConst.userPlaceHolder : AppConst.chatBotPlaceHolder,
            fit: BoxFit.cover,
            width: width,
            height: width,
          ),
        ),
      ),
    );
  }
}
