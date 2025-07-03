import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  final String name;
  final String avatar;

  const ChatRoomPage({
    super.key,
    required this.name,
    required this.avatar,
  });

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<String> messages = [
    "Hi, I need help with my sink.",
    "Sure, what seems to be the problem?",
    "It's leaking badly since yesterday.",
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE67E22),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.avatar),
              radius: 18,
            ),
            const SizedBox(width: 12),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.grey[200]
                          : const Color(0xFFE67E22),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        color: index % 2 == 0 ? Colors.black87 : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFFE67E22)),
                  onPressed: _sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
