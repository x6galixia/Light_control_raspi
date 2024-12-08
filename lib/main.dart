import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light Control',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set primary swatch for the theme
      ),
      home: LightControlScreen(),
    );
  }
}

class LightControlScreen extends StatelessWidget {
  final String serverUrl = 'http://192.168.1.100:5000/toggle';

  Future<void> toggleLight(String state) async {
    try {
      final response = await http.get(Uri.parse('$serverUrl?state=$state'));

      if (response.statusCode == 200) {
        print('$state request sent successfully');
      } else {
        print('Failed to send $state request');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                toggleLight('on');
              },
              child: Text('Turn ON'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Fixed primary issue here
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                toggleLight('off');
              },
              child: Text('Turn OFF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Fixed primary issue here
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
