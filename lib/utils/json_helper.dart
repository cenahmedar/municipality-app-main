String getJsonString(String key, Map<String, dynamic> json) {
  if (!json.containsKey(key)) return '';
  if (json[key] == null) return '';
  if (json[key] is String) {
    String string = json[key];
    if (string.startsWith('"')) string = string.substring(1);
    if (string.endsWith('"')) string = string.substring(0, string.length - 1);
    return string;
  } else
    return json[key].toString();
}

int getJsonInt(String key, Map<String, dynamic> json) {
  try {
    if (!json.containsKey(key)) return -1;
    if (json[key] == null) return -1;

    if (json[key] is String)
      return int.parse(json[key]);
    else if (json[key] is num)
      return (json[key] as num).toInt();
    else
      return -1;
  } catch (e) {
    return -1;
  }
}

double getJsonDouble(String key, Map<String, dynamic> json) {
  if (!json.containsKey(key)) return -1.0;
  if (json[key] == null) return -1.0;

  if (json[key] is String)
    return double.parse(json[key]);
  else if (json[key] is double)
    return json[key];
  else if (json[key] is int)
    return (json[key] as num).toDouble();
  else
    return -1.0;
}

bool getJsonBool(String key, Map<String, dynamic> json) {
  if (!json.containsKey(key)) return false;
  if (json[key] == null) return false;

  if (json[key] is String)
    return int.parse(json[key]) != 0;
  else if (json[key] is num)
    return (json[key] as num).toInt() != 0;
  else
    return false;
}
