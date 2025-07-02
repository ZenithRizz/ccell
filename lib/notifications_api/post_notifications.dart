import 'package:http/http.dart' as http;
import 'dart:convert';

import 'notification_model.dart';

Future<void> postNotification(NotificationModel notification) async {
  final url = Uri.parse('https://ccell-notification-api.onrender.com/api/notifications'); // Replace with your real URL

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': '24ucs202@lnmiit.ac.in',
      },
      body: jsonEncode(notification.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("✅ Notification posted successfully");
    } else {
      print("❌ Failed with status: ${response.statusCode}: ${response.body}");
    }
  } catch (e) {
    print("⚠️ Error posting notification: $e");
  }
}
