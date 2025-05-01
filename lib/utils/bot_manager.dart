import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class BotManager {
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Map<String, dynamic>> sendMessage(
    String message,
    String messageId,
    String conversationId,
  ) async {
    try {
      Map<String, dynamic> data = {'query': message};
      if (messageId != '') data['pre_message_id'] = messageId;
      if (conversationId != '') data['conversation_id'] = conversationId;
      String body = json.encode(data);
      final res = await http.post(
        Uri.parse('http://localhost:3000/api/v1/chat-messages'),
        headers: headers,
        body: body,
      );
      if (res.statusCode == 200) {
        return json.decode(res.body) as Map<String, dynamic>;
      }
      throw Exception('Failed to connect to the server.');
    } catch (e) {
      log('$e');
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }
}
