import 'package:flutter/material.dart';
import 'package:squad/utils/utils.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: loadMockUsers(), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(
                        'Age: ${user.age}, Gender: ${user.gender}, Orientation: ${user.sexualOrientation}'),
                  );
                },
              );
          }
      }),
    );
  }
}