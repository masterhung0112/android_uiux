import 'package:flutter/material.dart';

class CustomAppThemeData {
  final Color plusColor;

  const CustomAppThemeData({
    required this.plusColor,
  });

  CustomAppThemeData copyWith({Color? plusColor}) {
    return CustomAppThemeData(
      plusColor: plusColor ?? this.plusColor,
    );
  }

  static CustomAppThemeData get dark {
    return const CustomAppThemeData(
      plusColor: Colors.red,
    );
  }

  static CustomAppThemeData get light {
    return const CustomAppThemeData(
      plusColor: Colors.green,
    );
  }
}

class CustomAppTheme extends InheritedWidget {
  const CustomAppTheme(
      {super.key, required super.child, required this.customAppTheme});
  final CustomAppThemeData customAppTheme;

  // Allow the other to custom the different color
  static CustomAppThemeData of(BuildContext context) {
    final c = context.dependOnInheritedWidgetOfExactType<CustomAppTheme>();
    return c != null
        ? c.customAppTheme
        : Theme.of(context).brightness == Brightness.light
            ? CustomAppThemeData.light
            : CustomAppThemeData.dark;
  }

  @override
  bool updateShouldNotify(CustomAppTheme oldWidget) =>
      customAppTheme != oldWidget.customAppTheme;
}

extension CustomTheme on ThemeData {
  CustomAppThemeData get custom => brightness == Brightness.dark
      ? CustomAppThemeData.dark
      : CustomAppThemeData.light;
}

class ChildWithCustomAppTheme extends StatelessWidget {
  const ChildWithCustomAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.add, color: CustomAppTheme.of(context).plusColor);
  }
}

class IconForCustomAppTheme extends StatelessWidget {
  const IconForCustomAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppTheme(
        customAppTheme: CustomAppThemeData.light.copyWith(
          plusColor: Colors.red,
        ),
        child: Builder(builder: (BuildContext context) {
          return Icon(Icons.add, color: CustomAppTheme.of(context).plusColor);
        }));
  }
}
