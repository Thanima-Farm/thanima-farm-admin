import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeColors _getColors(){
  return ThemeColors(
    primaryGreen: Colors.green,
    brightGreen: Colors.green.withOpacity(0.5),
    green: Colors.green,
    bgColor: const Color.fromRGBO(242, 242, 242, 1),
    white: const Color.fromRGBO(255, 255, 255, 1),
    black: const Color(0xffffffff),
    black87:  Colors.black87,
  );
}

ThemeFontStyles _getFontStyles(){
  return ThemeFontStyles(
    subRegular: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}

ThemeData getTheme(){
  final ThemeColors colors = _getColors();
  final ThemeData theme = ThemeData(

    primaryColor: colors.primaryGreen,
    primaryColorLight: colors.brightGreen,
    primaryColorDark: colors.primaryGreen,
    scaffoldBackgroundColor: colors.bgColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colors.green),
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color: colors.primaryGreen),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      fillColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return colors.green;
        }return colors.white;
      })
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colors.primaryGreen,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2)
        )
      )
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: colors.primaryGreen,
      secondary: colors.primaryGreen,
      background: colors.bgColor,
    )
  ).copyFrom(
    CustomThemeData(
      colors: _getColors(),
      fontStyle: _getFontStyles(),
    )
  );
  return theme;
}

CustomThemeData? _appTheme;
extension CustomTheme on ThemeData{
  CustomThemeData get appTheme => _appTheme!;
  ThemeData copyFrom(CustomThemeData appTheme){
    _appTheme = appTheme;
    return this;
  }
}

class CustomThemeData {
  CustomThemeData({
    required this.colors,
    required this.fontStyle,
});
  final ThemeColors colors;
  final ThemeFontStyles fontStyle;
}

class ThemeFontStyles{
  ThemeFontStyles({
    required this.subRegular,
});
  TextStyle subRegular;
}
class ThemeColors {
  ThemeColors({
    required this.primaryGreen,
    required this.brightGreen,
    required this.green,
    required this.bgColor,
    required this.white,
    required this.black,
    required this.black87,
});
  final Color primaryGreen;
  final Color brightGreen;
  final Color green;
  final Color bgColor;
  final Color white;
  final Color black;
  final Color black87;
}