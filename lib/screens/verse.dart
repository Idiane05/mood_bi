import 'package:flutter/material.dart';
import '../services/api_service.dart';

class VerseScreen extends StatelessWidget {
  const VerseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the mood passed from MoodScreen
    final String mood = ModalRoute.of(context)!.settings.arguments as String;

    // Determine the background image based on the mood
    String backgroundImage;
    if (mood == 'happy') {
      backgroundImage = 'assets/happy.jpeg'; // Replace with your actual image
    } else if (mood == 'confused') {
      backgroundImage = 'assets/confused.jpeg'; // Replace with your actual image
    } else if (mood == 'sad') {
      backgroundImage = 'assets/sad.jpeg'; // Replace with your actual image
    } else {
      backgroundImage = 'assets/default.jpeg'; // Fallback image
    }

    return Scaffold(
      body: Stack(
        children: [
          // Dynamically set the background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder<String>(
            future: ApiService.fetchVerse(mood), // Fetch a verse based on the mood
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17), fontSize: 18),
                  ),
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data ?? "No verse available.",
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 54, 50, 50),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.black54,
              child: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 63, 47, 47)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}