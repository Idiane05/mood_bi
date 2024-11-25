import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mood.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmojiButton(
                    emoji: "😊",
                    label: "Happy",
                    mood: 'happy',
                  ),
                  EmojiButton(
                    emoji: "😕",
                    label: "Confused",
                    mood: 'confused',
                  ),
                  EmojiButton(
                    emoji: "😢",
                    label: "Sad",
                    mood: 'sad',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String emoji;
  final String label;
  final String mood;
  
  const EmojiButton({super.key, required this.emoji, required this.label, required this.mood});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          // adding icon button
          icon: Text(emoji, style: const TextStyle(fontSize: 40)),
          onPressed: () {
            // passing the arguments 
            Navigator.pushNamed(context, '/verse', arguments: mood);
          },
        ),
        
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}