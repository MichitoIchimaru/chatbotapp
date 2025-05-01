import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../utils/bot_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final BotManager _botManager = BotManager();
  String messageId = '';
  String conversationId = '';

  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      String message = _controller.text;
      setState(() {
        _messages.insert(0, {"sender": "user", "text": message});
      });
      _controller.clear();
      Map<String, dynamic> answer = await _botManager.sendMessage(
        message,
        messageId,
        conversationId,
      );
      _generateBotReply(answer['answer']);
      messageId = answer['message_id'];
      conversationId = answer['conversation_id'];
    }
  }

  void _generateBotReply(String answerMessage) {
    setState(() {
      _messages.insert(0, {"sender": "bot", "text": answerMessage});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isUser = _messages[index]["sender"] == "user";
                return ListTile(
                  title: Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blueAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MarkdownBody(
                        data: _messages[index]["text"]!,
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(
                            color: isUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "メッセージを入力"),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
