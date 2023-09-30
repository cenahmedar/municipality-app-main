import 'dart:math';

String formatPrice(String currency, double? price) {
  if (price == null) return '${currency}0';

  if (price < 0) price = 0;

  return '$currency${price.round()}';
}

String formatHour(double seconds) {
  int hours = (seconds / 3600).floor();
  final minutes = ((seconds - (hours * 3600)) / 60).floor().abs();

  if (hours >= 24) hours = hours - 24;

  final stringH = hours < 10 ? '0$hours' : '$hours';
  final stringM = minutes < 10 ? '0$minutes' : '$minutes';

  return '$stringH:$stringM';
}

String formatDistance(double distance, String meters, String kilometers,
    {int precision = 2}) {
  if (distance == -1) return '? $kilometers';
  if (distance < 1000)
    return '${distance.floor()} $meters';
  else
    return '${toPrecision(distance / 1000, precision)} $kilometers';
}

double toPrecision(double number, int fractionDigits) {
  var mod = pow(10, fractionDigits.toDouble()).toDouble();
  return ((number * mod).round().toDouble() / mod);
}

String replaceFarsiNumber(String input) {
  final newInput = input
      .replaceAll('٠', '0')
      .replaceAll('١', '1')
      .replaceAll('٢', '2')
      .replaceAll('٣', '3')
      .replaceAll('٤', '4')
      .replaceAll('٥', '5')
      .replaceAll('٦', '6')
      .replaceAll('٧', '7')
      .replaceAll('٨', '8')
      .replaceAll('٩', '9');
  return newInput;
}
