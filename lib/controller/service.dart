import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:userapp/model/usemodel.dart';

Future<List<Usersmodel>?> getUserData(since) async {
  List<Usersmodel>? result;

  var url = Uri.parse(
    "https://api.github.com/users?since=$since&per_page=10",
  );
  try {
    final response = await http
        .get(
      url,
  
        );
 
    if (response.statusCode == 200) {
      print("user SUCCESS");

      final item = jsonDecode(response.body);
      result = usersmodelFromJson(jsonEncode(item));
    } else {
      print("user ERROR");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
