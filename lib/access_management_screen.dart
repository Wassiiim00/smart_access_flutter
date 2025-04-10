import 'dart:io';
import 'package:flutter/material.dart';
import 'face_detection_camera.dart';


class AccessManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users; // Dynamic list of users
  final Function(Map<String, dynamic>) onAddUser; // Callback to add users

  const AccessManagementScreen({
    super.key,
    required this.users,
    required this.onAddUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Access',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(File(user['imagePath'])),
            ),
            title: Text(
              user['name'],
              style: const TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: Text(
              'Access Level: ${user['accessLevel']}',
              style: const TextStyle(fontFamily: 'Poppins'),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Delete logic (optional)
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => FaceDetectionScreen(cameras: []),
            ),
          );

          if (newUser != null) {
            onAddUser(newUser); // Add the new user via the callback
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}