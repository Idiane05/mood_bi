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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
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
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  EmojiButton({required this.emoji, required this.label, required this.mood});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          // ignore: prefer_const_constructors
          icon: Text(emoji, style: TextStyle(fontSize: 40)),
          onPressed: () {
            // Pass the mood as an argument to VerseScreen
            Navigator.pushNamed(context, '/verse', arguments: mood);
          },
        ),
        // ignore: prefer_const_constructors
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}