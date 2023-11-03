import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/openai_model.dart';
import 'open_ai_constants.dart';

class RecommendationService {
  static Future<GptData> getRecommendation({required String prompt}) async {
    late GptData gptData = GptData(
      warning: '',
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      String promptGPT = prompt;

      String propmtData = promptGPT;

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": propmtData,
        "temperature": 1,
        "max_tokens": 500,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      final response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = GptData.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Error occured when sending Request');
    }

    return gptData;
  }
}
