import 'package:flutter/material.dart';
import 'constellations_web_view.dart'; // Import for navigation to the WebView

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConstellationsWebView()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button color
              onPrimary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button padding
            ),
            child: Text('Detect Constellations'),
          ),
          SizedBox(height: 40), // Space between the buttons
          ElevatedButton(
            onPressed: () {
              // Show a 'Coming Soon!' popup
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Coming Soon!'),
                    content: Text('The feature to detect stars is coming soon.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button color
              onPrimary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Button padding
            ),
            child: Text('Detect Stars'),
          ),
        ],
      ),
    );
  }
}
