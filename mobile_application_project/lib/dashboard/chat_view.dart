import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<Map<String, String>> chats = [
    {
      'name': 'Rosalie Adkins',
      'message': 'Aromatherapy While ...',
      'time': '13:21',
      'image': 'assets/images/doctor1.png'
    },
    {
      'name': 'Marc Lindsey',
      'message': 'Learn About Swimmers ...',
      'time': '13:21',
      'image': 'assets/images/doctor2.png'
    },
    {
      'name': 'Mary Floyd',
      'message': 'Colon Flush For An ...',
      'time': '13:21',
      'image': 'assets/images/doctor3.png'
    },
    {
      'name': 'Cecilia Chavez',
      'message': 'Gastroenteritis Is A ...',
      'time': '13:21',
      'image': 'assets/images/doctor4.png'
    },
    {
      'name': 'Lelia Parks',
      'message': 'How To Combat A Bout ...',
      'time': '13:21',
      'image': 'assets/images/doctor5.png'
    },
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFF4E8FF),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Tabs
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryButton('All'),
                _buildCategoryButton('Group'),
                _buildCategoryButton('Private'),
              ],
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat['image']!),
                    radius: 24,
                  ),
                  title: Text(
                    chat['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    chat['message']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Text(
                    chat['time']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    // Navigate to chat details
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
