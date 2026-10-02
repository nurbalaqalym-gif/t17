import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({super.key});

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  String result = '';

  void decodeJson() {
    String jsonString = '''
    {
      "id": 1,
      "name": "Nurbala",
      "email": "nurbala@gmail.com",
      "age": 17
    }
    ''';

    Map<String, dynamic> user = jsonDecode(jsonString);

    setState(() {
      result =
          '''
ID: ${user['id']}
Name: ${user['name']}
Email: ${user['email']}
Age: ${user['age']}
''';
    });
  }

  void encodeJson() {
    Map<String, dynamic> user = {
      'id': 2,
      'name': 'Aruzhan',
      'email': 'aruzhan@gmail.com',
      'age': 18,
    };

    String jsonString = jsonEncode(user);

    setState(() {
      result = jsonString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Example'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Working with JSON',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: decodeJson,
                child: const Text('Decode JSON'),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: encodeJson,
                child: const Text('Encode JSON'),
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result.isEmpty ? 'Result will appear here' : result,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
