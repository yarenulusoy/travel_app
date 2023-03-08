import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;

  double get lowValue => height * 0.01; //700/100=7
  double get normalValue => height * 0.02; //700/50=14
  double get mediumValue => height * 0.04; //700/25=28
  double get highValue => height * 0.1; //700/10=70

}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get paddingVerticalLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingVerticalNormal => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingVerticalMedium => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingVerticalHigh => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingHorizontalLow => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingHorizontalNormal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingHorizontalMedium => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHorizontalHigh => EdgeInsets.symmetric(horizontal: highValue);

}

extension RadiusExtension on BuildContext{
  BorderRadius get radiusLow => BorderRadius.circular(lowValue);
  BorderRadius get radiusNormal => BorderRadius.circular(normalValue);
  BorderRadius get radiusMedium => BorderRadius.circular(mediumValue);
  BorderRadius get radiusHigh => BorderRadius.circular(highValue);
}


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}


