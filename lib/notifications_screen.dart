import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'notifications_api/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationsPage> {
  late Future<List<NotificationModel>> futureNotifications;

  @override
  void initState() {
    super.initState();
    futureNotifications = fetchNotifications();
  }

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await http.get(
      Uri.parse('https://ccell-notification-api.onrender.com/api/notifications'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => NotificationModel.fromJson(data)).toList().reversed.toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> _refreshNotifications() async {
    setState(() {
      futureNotifications = fetchNotifications();
    });
  }

  String formateDate(String isoString) {
    final date = DateTime.parse(isoString);
    return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}   ${date.day}/${date.month}/${date.year}";
  }

  String formatEventDate(DateTime date) {
    return DateFormat("d MMMM, yyyy").format(date);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'NOTIFICATIONS',
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<NotificationModel>>(
                  future: futureNotifications,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '❌ Failed to load notifications',
                          style: GoogleFonts.inter(color: Colors.white70),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No notifications available',
                          style: GoogleFonts.inter(color: Colors.white70),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final notification = snapshot.data![index];
                          return Card(
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                          child: Container(
                          decoration: BoxDecoration(
                          gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                          Color(0xFF353F54),
                          Color(0xFF222834),
                          ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 2,
                          ),
                          ),
                          child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                          notification.title,
                          style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                          ),
                          ),
                          subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const SizedBox(height: 10),
                          Text(
                          notification.message,
                          style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white70,
                          ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                          "Event Date: ${formatEventDate(notification.eventDate)}",
                          style: GoogleFonts.inter(color: Colors.white70),
                          ),
                          Text(
                          "Timing: ${notification.timing}",
                          style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white70,
                          ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                          "Posted: ${formateDate(notification.datePosted)}",
                          style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
