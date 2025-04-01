import 'package:flutter/material.dart';

// class CustomTextFormField extends StatefulWidget {
//   final TextEditingController? controller;
//   final Function? validator;
//   final TextInputType keyboardType;
//   final TextCapitalization textCapitalization;
//   final bool enabled;
//   final bool autofocus;
//   final Widget? prefix;
//   final String? title;
//   final String? hintText;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? initialValue;
//   final Function? onChanged;
//   final TextInputAction textInputAction;
//   final Function? onFieldTap;
//   final Widget? suffixIcon;
//   final AutovalidateMode? autoValidateMode;
//   final bool readOnly;
//   final int maxLines;
//   final int? maxLength;
//   final Color? textColor;
//   final InputBorder? enableBorder;
//   final InputBorder? focusBorder;
//   final InputBorder? errorBorder;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextStyle? hintStyle;
//   final List<String>? autoFillHints;
//   final Widget? errorWidget;
//   final bool showErrorSuffixIcon;
//
//   const CustomTextFormField({super.key,
//     this.controller,
//     this.validator,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.title,
//     this.keyboardType = TextInputType.text,
//     this.prefix,
//     this.enabled = true,
//     this.autofocus = false,
//     this.hintText,
//     this.inputFormatters,
//     this.initialValue,
//     this.onChanged,
//     this.textInputAction = TextInputAction.next,
//     this.onFieldTap,
//     this.suffixIcon,
//     this.autoValidateMode,
//     this.readOnly = false,
//     this.maxLines = 1,
//     this.maxLength,
//     this.textColor,
//     this.enableBorder,
//     this.focusBorder,
//     this.errorBorder,
//     this.contentPadding,
//     this.hintStyle,
//     this.autoFillHints,
//     this.errorWidget,
//     this.showErrorSuffixIcon = false,
//   }) : assert(initialValue == null || controller == null);
//
//   @override
//   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// }
//
// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   String? errorMesg;
//
//   updateErrorMesg(String? val) {
//     String? result = widget.validator!(val);
//     setState(() {
//       errorMesg = result;
//     });
//     return result;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         bottom: 24.h,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget.title == null
//               ? const SizedBox()
//               : Padding(
//             padding: EdgeInsets.only(left: 10.w, bottom: 8.h),
//             child: Text(
//               widget.title!,
//               style: Theme.of(context).textTheme.headline6!.copyWith(
//                 fontFamily: "Inter",
//                 color: Theme.of(context).appTheme.colors.primaryGreen,
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//           TextFormField(
//             maxLength: widget.maxLength,
//             maxLines: widget.maxLines,
//             onTap: widget.onFieldTap as void Function()?,
//             controller: widget.controller,
//             initialValue: widget.initialValue,
//             readOnly: widget.readOnly,
//             autofillHints: widget.autoFillHints,
//             onChanged: (text) {
//               if (widget.onChanged == null) return;
//               return widget.onChanged!(text);
//             },
//             // since we have used setState we can't use this property when using setState
//             // autovalidateMode:autoValidateMode?? AutovalidateMode.onUserInteraction,
//             enabled: widget.enabled,
//             autofocus: widget.autofocus,
//             style: Theme.of(context).textTheme.headline2!.copyWith(
//               color:
//               widget.textColor ?? Theme.of(context).appTheme.colors.black,
//             ),
//             decoration: InputDecoration(
//               counterText: "",
//               contentPadding: widget.contentPadding ??
//                   EdgeInsets.symmetric(
//                     // vertical: 12.h,
//                     horizontal: 15.w,
//                   ),
//               filled: true,
//               fillColor: Colors.white,
//               suffixIcon: widget.suffixIcon ??
//                   (errorMesg != null && widget.showErrorSuffixIcon
//                       ? Icon(
//                     Icons.error,
//                     size: 30.sp,
//                     color: const Color(0xFFfa6400),
//                   )
//                       : const SizedBox()),
//               prefix: widget.prefix,
//               hintText: widget.hintText,
//               hintStyle: widget.hintStyle ??
//                   Theme.of(context).textTheme.titleSmall!.copyWith(
//                     fontSize: 16.sp,
//                   ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: widget.enableBorder,
//               focusedBorder: widget.focusBorder,
//               focusedErrorBorder: widget.errorBorder ??
//                   OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(5.r),
//                       topRight: Radius.circular(5.r),
//                       topLeft: Radius.circular(5.r),
//                     ),
//                   ),
//               errorBorder: widget.errorBorder ??
//                   OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(5.r),
//                       topRight: Radius.circular(5.r),
//                       topLeft: Radius.circular(5.r),
//                     ),
//                   ),
//               errorStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   height: -10, color: Colors.transparent, fontSize: 0),
//             ),
//             inputFormatters: widget.inputFormatters,
//             validator: (val) => updateErrorMesg(val),
//             keyboardType: widget.keyboardType,
//             textCapitalization: widget.textCapitalization,
//             textInputAction: widget.textInputAction,
//           ),
//           (errorMesg == null || errorMesg == "")
//               ? const SizedBox()
//               : widget.errorWidget ??
//               InputErrorLabel(
//                 errorMessage: "$errorMesg",
//               ),
//         ],
//       ),
//     );
//   }
// }

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final Function? validator;
//   final TextInputType keyboardType;
//   final TextCapitalization textCapitalization;
//   final bool enabled;
//   final bool autofocus;
//   final Widget? prefix;
//   final String? title;
//   final String? hintText;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? initialValue;
//   final Function? onChanged;
//   final TextInputAction textInputAction;
//   final Function? onFieldTap;
//   final Widget? suffixIcon;
//   final AutovalidateMode? autoValidateMode;
//   final bool readOnly;
//   final int maxLines;
//   final int? maxLength;
//   final Color? textColor;
//   final InputBorder? enableBorder;
//   final InputBorder? focusBorder;
//   final InputBorder? errorBorder;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextStyle? hintStyle;
//   final List<String>? autoFillHints;
//   final Widget? errorWidget;
//   final bool showErrorSuffixIcon;
//
//   const CustomTextFormField({super.key,
//     this.controller,
//     this.validator,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.title,
//     this.keyboardType = TextInputType.text,
//     this.prefix,
//     this.enabled = true,
//     this.autofocus = false,
//     this.hintText,
//     this.inputFormatters,
//     this.initialValue,
//     this.onChanged,
//     this.textInputAction = TextInputAction.next,
//     this.onFieldTap,
//     this.suffixIcon,
//     this.autoValidateMode,
//     this.readOnly = false,
//     this.maxLines = 1,
//     this.maxLength,
//     this.textColor,
//     this.enableBorder,
//     this.focusBorder,
//     this.errorBorder,
//     this.contentPadding,
//     this.hintStyle,
//     this.autoFillHints,
//     this.errorWidget,
//     this.showErrorSuffixIcon = false,
//   }) : assert(initialValue == null || controller == null);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  TextFormField(
//       enabled: enabled,
//             autofocus: autofocus,
//             maxLength: maxLength,
//             maxLines: maxLines,
//             onTap: onFieldTap as void Function()?,
//             controller: controller,
//             initialValue: initialValue,
//             readOnly: readOnly,
//             autofillHints: autoFillHints,
//             onChanged: (text) {
//               if (onChanged == null) return;
//               return onChanged!(text);
//             },
//             style: Theme.of(context).textTheme.headline2!.copyWith(
//               color:
//               textColor ?? Theme.of(context).appTheme.colors.black,
//             ),
//             decoration: InputDecoration(
//               counterText: "",
//               contentPadding: contentPadding ??
//                   EdgeInsets.symmetric(
//                     // vertical: 12.h,
//                     horizontal: 15.w,
//                   ),
//               filled: true,
//               fillColor: Colors.white,
//               suffixIcon: suffixIcon ?? const SizedBox(),
//               prefix: prefix,
//               hintText: hintText,
//               hintStyle: hintStyle ??
//                   Theme.of(context).textTheme.titleSmall!.copyWith(
//                     fontSize: 16.sp,
//                   ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: enableBorder,
//               focusedBorder: focusBorder,
//               focusedErrorBorder: errorBorder ??
//                   OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(5.r),
//                       topRight: Radius.circular(5.r),
//                       topLeft: Radius.circular(5.r),
//                     ),
//                   ),
//               errorBorder: errorBorder ??
//                   OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(5.r),
//                       topRight: Radius.circular(5.r),
//                       topLeft: Radius.circular(5.r),
//                     ),
//                   ),
//               errorStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   height: -10, color: Colors.transparent, fontSize: 0),
//             ),
//             inputFormatters: inputFormatters,
//             validator: (val) {
//         if(validator!=null) {
//           validator!(val);
//         }
//         return null;
//             },
//             keyboardType: keyboardType,
//             textCapitalization: textCapitalization,
//             textInputAction: textInputAction,
//     );
//   }
// }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.hintText,
    this.maxLength,
    this.focusNode,
  });

  final TextEditingController controller;
  final Function validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
    );
  }
}
