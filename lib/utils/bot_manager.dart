import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BotManager {
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Map<String, dynamic>> sendMessage(
    String message,
    String messageId,
    String conversationId,
  ) async {
    try {
      await dotenv.load(fileName: '.env');
      Map<String, dynamic> data = {'query': message};
      if (messageId != '') data['pre_message_id'] = messageId;
      if (conversationId != '') data['conversation_id'] = conversationId;
      String body = json.encode(data);
      http.Response res = await http.post(
        //        Uri.parse('http://localhost:3000/api/v1/chat-messages'),
        Uri.parse(dotenv.get('BFF_URL')),
        headers: headers,
        body: body,
      );
      if (res.statusCode == 200) {
        return json.decode(res.body) as Map<String, dynamic>;
      } else {
        return {'answer': json.decode(res.body)['answer']};
      }
    } catch (e) {
      log('$e');
      return {'answer': '回答が得られませんでした'};
    }
  }
}
