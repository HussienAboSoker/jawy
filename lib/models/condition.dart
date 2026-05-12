import 'package:jawy/models/json_parser.dart';

class Condition {
  final String text;
  final String icon;
  final int code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return ConditionParser().parse(json);
  }
}

class ConditionParser implements JsonParser<Condition> {
  @override
  Condition parse(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
