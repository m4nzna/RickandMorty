import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff636117),
      surfaceTint: Color(0xff636117),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeae68e),
      onPrimaryContainer: Color(0xff4b4900),
      secondary: Color(0xff565992),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe0e0ff),
      onSecondaryContainer: Color(0xff3e4278),
      tertiary: Color(0xff4f5b92),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdde1ff),
      onTertiaryContainer: Color(0xff374379),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcfaec),
      onSurface: Color(0xff1c1c14),
      onSurfaceVariant: Color(0xff4c4639),
      outline: Color(0xff7d7667),
      outlineVariant: Color(0xffcec6b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffceca75),
      primaryFixed: Color(0xffeae68e),
      onPrimaryFixed: Color(0xff1d1d00),
      primaryFixedDim: Color(0xffceca75),
      onPrimaryFixedVariant: Color(0xff4b4900),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff11144b),
      secondaryFixedDim: Color(0xffbfc2ff),
      onSecondaryFixedVariant: Color(0xff3e4278),
      tertiaryFixed: Color(0xffdde1ff),
      onTertiaryFixed: Color(0xff07164b),
      tertiaryFixedDim: Color(0xffb8c4ff),
      onTertiaryFixedVariant: Color(0xff374379),
      surfaceDim: Color(0xffdddacd),
      surfaceBright: Color(0xfffcfaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f4e7),
      surfaceContainer: Color(0xfff1eee1),
      surfaceContainerHigh: Color(0xffebe8db),
      surfaceContainerHighest: Color(0xffe5e3d6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff393800),
      surfaceTint: Color(0xff636117),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff727025),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d3167),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6468a2),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff263267),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e6aa2),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcfaec),
      onSurface: Color(0xff11120a),
      onSurfaceVariant: Color(0xff3b3629),
      outline: Color(0xff585244),
      outlineVariant: Color(0xff736c5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffceca75),
      primaryFixed: Color(0xff727025),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59570c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6468a2),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4c5088),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5e6aa2),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff455188),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c7ba),
      surfaceBright: Color(0xfffcfaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f4e7),
      surfaceContainer: Color(0xffebe8db),
      surfaceContainerHigh: Color(0xffdfddd0),
      surfaceContainerHighest: Color(0xffd4d2c5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2f2e00),
      surfaceTint: Color(0xff636117),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4d4b00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff23265c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff40447b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1b285c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff39467b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcfaec),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff302c20),
      outlineVariant: Color(0xff4e493b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffceca75),
      primaryFixed: Color(0xff4d4b00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff363400),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff40447b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff292d63),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff39467b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff222f63),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb9ad),
      surfaceBright: Color(0xfffcfaec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f1e4),
      surfaceContainer: Color(0xffe5e3d6),
      surfaceContainerHigh: Color(0xffd7d5c8),
      surfaceContainerHighest: Color(0xffc9c7ba),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffceca75),
      surfaceTint: Color(0xffceca75),
      onPrimary: Color(0xff333200),
      primaryContainer: Color(0xff4b4900),
      onPrimaryContainer: Color(0xffeae68e),
      secondary: Color(0xffbfc2ff),
      onSecondary: Color(0xff272b60),
      secondaryContainer: Color(0xff3e4278),
      onSecondaryContainer: Color(0xffe0e0ff),
      tertiary: Color(0xffb8c4ff),
      onTertiary: Color(0xff202c61),
      tertiaryContainer: Color(0xff374379),
      onTertiaryContainer: Color(0xffdde1ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff14140c),
      onSurface: Color(0xffe5e3d6),
      onSurfaceVariant: Color(0xffcec6b4),
      outline: Color(0xff979080),
      outlineVariant: Color(0xff4c4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e3d6),
      inversePrimary: Color(0xff636117),
      primaryFixed: Color(0xffeae68e),
      onPrimaryFixed: Color(0xff1d1d00),
      primaryFixedDim: Color(0xffceca75),
      onPrimaryFixedVariant: Color(0xff4b4900),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff11144b),
      secondaryFixedDim: Color(0xffbfc2ff),
      onSecondaryFixedVariant: Color(0xff3e4278),
      tertiaryFixed: Color(0xffdde1ff),
      onTertiaryFixed: Color(0xff07164b),
      tertiaryFixedDim: Color(0xffb8c4ff),
      onTertiaryFixedVariant: Color(0xff374379),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff3a3a31),
      surfaceContainerLowest: Color(0xff0e0f08),
      surfaceContainerLow: Color(0xff1c1c14),
      surfaceContainer: Color(0xff202018),
      surfaceContainerHigh: Color(0xff2a2a22),
      surfaceContainerHighest: Color(0xff35352c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4e088),
      surfaceTint: Color(0xffceca75),
      onPrimary: Color(0xff282700),
      primaryContainer: Color(0xff979445),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd9d9ff),
      onSecondary: Color(0xff1c1f55),
      secondaryContainer: Color(0xff888cc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd5daff),
      onTertiary: Color(0xff142155),
      tertiaryContainer: Color(0xff828ec8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe5dbc9),
      outline: Color(0xffb9b1a0),
      outlineVariant: Color(0xff97907f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e3d6),
      inversePrimary: Color(0xff4c4a00),
      primaryFixed: Color(0xffeae68e),
      onPrimaryFixed: Color(0xff131200),
      primaryFixedDim: Color(0xffceca75),
      onPrimaryFixedVariant: Color(0xff393800),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff050741),
      secondaryFixedDim: Color(0xffbfc2ff),
      onSecondaryFixedVariant: Color(0xff2d3167),
      tertiaryFixed: Color(0xffdde1ff),
      onTertiaryFixed: Color(0xff000b3c),
      tertiaryFixedDim: Color(0xffb8c4ff),
      onTertiaryFixedVariant: Color(0xff263267),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff45453c),
      surfaceContainerLowest: Color(0xff070803),
      surfaceContainerLow: Color(0xff1e1e16),
      surfaceContainer: Color(0xff282820),
      surfaceContainerHigh: Color(0xff33332a),
      surfaceContainerHighest: Color(0xff3e3e35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8f49a),
      surfaceTint: Color(0xffceca75),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffcac671),
      onPrimaryContainer: Color(0xff0c0c00),
      secondary: Color(0xfff0eeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbabefd),
      onSecondaryContainer: Color(0xff00003c),
      tertiary: Color(0xffefefff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb3bffd),
      onTertiaryContainer: Color(0xff00072e),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff9efdc),
      outlineVariant: Color(0xffcac2b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e3d6),
      inversePrimary: Color(0xff4c4a00),
      primaryFixed: Color(0xffeae68e),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffceca75),
      onPrimaryFixedVariant: Color(0xff131200),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbfc2ff),
      onSecondaryFixedVariant: Color(0xff050741),
      tertiaryFixed: Color(0xffdde1ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb8c4ff),
      onTertiaryFixedVariant: Color(0xff000b3c),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff515147),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff202018),
      surfaceContainer: Color(0xff313128),
      surfaceContainerHigh: Color(0xff3c3c33),
      surfaceContainerHighest: Color(0xff47473e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
