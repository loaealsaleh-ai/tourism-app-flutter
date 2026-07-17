import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {

  Future<String> translate(String text,String from,String to) async {

    final response = await http.get(
      Uri.parse("https://api.mymemory.translated.net/get?q=$text&langpair=$from|$to",
      ),
    );

    final data = jsonDecode(response.body);
   // print(data["responseData"]["translatedText"]);

    return data["responseData"]["translatedText"];
  }
}