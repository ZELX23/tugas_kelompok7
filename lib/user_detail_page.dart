import 'package:flutter/material.dart';
import 'api_service.dart';

class UserDetailPage extends StatelessWidget {
  final int id;

  UserDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: FutureBuilder(
        future: ApiService().getUserById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final user = snapshot.data;
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${user?['id']}'),
                Text('Name: ${user?['first_name']} ${user?['last_name']}'),
                Text('Email: ${user?['email']}'),
                // Tambahkan informasi pengguna lainnya
              ],
            ),
          );
        },
      ),
    );
  }
}
