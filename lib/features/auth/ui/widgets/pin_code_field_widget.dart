import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldWidget extends StatelessWidget {
  final Function(String pin) onChanged;
  final TextEditingController? controller;

  const PinCodeFieldWidget({Key? key, required this.onChanged, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 32.h),
      child: PinCodeTextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autoFocus: true,
        controller: controller,
        appContext: context,
        length: 6,
        textStyle: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.bold, fontFamily: "Inter"),
        onChanged: onChanged,
        onSubmitted: (pin) {},
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12.r),
          fieldHeight: 44,
          fieldWidth: 44,
          borderWidth: 1,
          activeColor: Colors.grey,
          inactiveColor: Colors.grey,
          selectedColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
