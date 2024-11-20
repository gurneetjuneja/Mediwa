import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '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'; // Replace with your actual API key
  final String baseUrl = 'https://api.groq.com/openai/v1'; // Updated endpoint
  final String model = 'llama3-groq-70b-8192-tool-use-preview';

  Future<String> sendMessageToGroqAPI(String userMessage) async {
    final url = Uri.parse('$baseUrl/chat/completions');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": userMessage}
          ],
          "model": model,
          "temperature": 0.5,
          "max_tokens": 1024,
          "top_p": 0.65,
          "stream": false,
          "stop": null,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content']; // Extract bot's message
      } else {
        throw Exception(
          'Failed to fetch response. Status code: ${response.statusCode}, Body: ${response.body}',
        );
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
