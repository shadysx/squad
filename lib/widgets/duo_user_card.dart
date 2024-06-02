import 'package:flutter/material.dart';
import 'package:squad/models/duo.dart';
import 'package:squad/models/user.dart';
import 'package:squad/utils/utils.dart';

class DuoUserCard extends StatefulWidget {
  final Duo duo;

  const DuoUserCard({super.key, required this.duo});

  @override
  State<DuoUserCard> createState() => _DuoUserCardState();
}

class _DuoUserCardState extends State<DuoUserCard> {
  late Future<User> _user1Future;
  late Future<User> _user2Future;

  @override
  void initState() {
    super.initState();
    _user1Future = getMockUserById(widget.duo.userId1);
    _user2Future = getMockUserById(widget.duo.userId2);
  }

  @override
  Widget build(BuildContext context) {
    _user1Future = getMockUserById(widget.duo.userId1);
    _user2Future = getMockUserById(widget.duo.userId2);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // User 1 information
          Expanded(
            child: FutureBuilder<User>(
              future: _user1Future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  User user1 = snapshot.data!; // Safe access after checking hasData
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                        child: Image.network(
                          user1.photoUrl, // Use data from snapshot
                          fit: BoxFit.cover,
                          height: 400,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user1.firstName} ${user1.lastName}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text('Age: ${user1.age}', style: const TextStyle(fontSize: 12)),
                            const SizedBox(height: 4),
                            Text('Gender: ${user1.gender}', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const SizedBox(width: 8.0),
          // User 2 information (similar structure with another FutureBuilder)
          Expanded(
            child: FutureBuilder<User>(
              future: _user2Future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  User user2 = snapshot.data!; // Safe access after checking hasData
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                        child: Image.network(
                          user2.photoUrl, // Use data from snapshot
                          fit: BoxFit.cover,
                          height: 400,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user2.firstName} ${user2.lastName}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text('Age: ${user2.age}', style: const TextStyle(fontSize: 12)),
                            const SizedBox(height: 4),
                            Text('Gender: ${user2.gender}', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
