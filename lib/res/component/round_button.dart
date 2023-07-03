import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final bool loading;
  void Function()? onTap;

  RoundButton(
      {super.key, required this.title, this.onTap, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.greenColor,
        ),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: AppColor.whiteColor,
                  )
                : Text(
                    title!,
                    style: const TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 20,
                    ),
                  )),
      ),
    );
  }
}
