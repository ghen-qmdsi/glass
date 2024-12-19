import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class Utils extends StatelessWidget {
  const Utils({super.key});

  @override
  Widget build(BuildContext context) {
    return Footer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        color: Colors.grey[850],
        child: const Column(
          mainAxisSize:
              MainAxisSize.min, // Ensures it doesn't take excess space
          children: [
            Text(
              '© 2024 QMDSI. All rights reserved.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 4),
            Center(
              child: Text(
                'This website and its content are the property of QMDSI. Unauthorized use, reproduction, or distribution is strictly prohibited.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
