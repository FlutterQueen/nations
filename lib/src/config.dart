part of 'controller.dart';

abstract class NationsConfig {
  const NationsConfig({
    this.fallbackLocale = const Locale('ar'),
    this.supportedLocales = const [
      Locale('ar'),
      Locale('en'),
    ],
    this.loader = const NationsJsonLoader(),
  });

  final Locale fallbackLocale;
  final List<Locale> supportedLocales;

  final NationsLoader loader;
}

class _NationsBaseConfig extends NationsConfig {
  const _NationsBaseConfig();
}
