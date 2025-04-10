import 'dart:io';
import 'package:flutter/material.dart';

class AddUserDetailsScreen extends StatefulWidget {
  final String imagePath;

  const AddUserDetailsScreen({super.key, required this.imagePath});

  @override
  _AddUserDetailsScreenState createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accessLevelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.file(File(widget.imagePath), height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _accessLevelController,
              decoration: const InputDecoration(labelText: "Access Level"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newUser = {
                  'name': _nameController.text,
                  'accessLevel': _accessLevelController.text,
                  'imagePath': widget.imagePath,
                };

                // Return the new user data to the previous screen
                Navigator.pop(context, newUser);
              },
              child: const Text("Save User"),
            ),
          ],
        ),
      ),
    );
  }
}