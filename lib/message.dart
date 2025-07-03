import 'package:flutter/material.dart';
import 'package:kaam_dekho/message/chat_room.dart';

// ignore: use_key_in_widget_constructors
class MessagesPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Ajay Kumar',
      'message': 'Please confirm the time',
      'time': '9:30 AM',
      'avatar': 'assets/avatars/ajay.jpg',
    },
    {
      'name': 'Sunita Reddy',
      'message': 'Got it, I\'ll be there',
      'time': '8:45 AM',
      'avatar': 'assets/avatars/sunita.jpg',
    },
    {
      'name': 'Manish',
      'message': 'Thank you!',
      'time': '7:20 AM',
      'avatar': 'assets/avatars/manish.jpg',
    },
    {
      'name': 'Pooja Mehta',
      'message': 'I need assistance with...',
      'time': 'Yesterday',
      'avatar': 'assets/avatars/pooja.jpg',
    },
    {
      'name': 'Rahul',
      'message': 'What is the status of the...',
      'time': 'Yesterday',
      'avatar': 'assets/avatars/rahul.jpg',
    },
    {
      'name': 'Vikram Singh',
      'message': '',
      'time': 'Yesterday',
      'avatar': 'assets/avatars/vikram.jpg',
    },
  ];

  final avatarColors = [
    Colors.blue[200]!,
    Colors.pink[200]!,
    Colors.green[200]!,
    Colors.purple[200]!,
    Colors.orange[200]!,
    Colors.teal[200]!,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatRoomPage(
                  name: message['name'],
                  avatar: message['avatar'],
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[100]!, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: ClipOval(
                    child: message['avatar'] != null && message['avatar'] != ''
                        ? Image.asset(
                            message['avatar'],
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          )
                        : Container(
                            color: avatarColors[index % avatarColors.length],
                            child: Center(
                              child: Text(
                                message['name']
                                    .split(' ')
                                    .map((n) => n[0])
                                    .join(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 15),

                // Message content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            message['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            message['time'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (message['message'] != '')
                        Text(
                          message['message'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
