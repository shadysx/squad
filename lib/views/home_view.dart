import 'package:flutter/material.dart';
import 'package:squad/models/duo.dart';
import 'package:squad/models/user.dart';
import 'package:squad/utils/utils.dart';
import 'package:squad/widgets/duo_user_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late Future<List<Duo>> _duosFuture;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _duosFuture = loadMockDuos();
  }

  void _handleSwipe(bool isLiked) {
    setState(() {
      _currentIndex++;
    });

    if (isLiked) {
      print('Liked user');
    } else {
      print('Disliked user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipeable Cards"),
      ),
      body: FutureBuilder<List<Duo>>(
        future: _duosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No user data available'));
          } else {
            final duos = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentIndex < duos.length)
                  DuoUserCard(duo: duos[_currentIndex])
                else
                  const Center(child: Text('No more users')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _handleSwipe(false),
                      child: const Text('Dislike'),
                    ),
                    ElevatedButton(
                      onPressed: () => _handleSwipe(true),
                      child: const Text('Like'),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  //   @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Swipeable Cards"),
  //     ),
  //     body: FutureBuilder<List<User>>(
  //       future: _usersFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('Error: ${snapshot.error}'));
  //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //           return const Center(child: Text('No user data available'));
  //         } else {
  //           final users = snapshot.data!;
  //           return Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               if (_currentIndex < users.length)
  //                 UserCard(user: users[_currentIndex])
  //               else
  //                 const Center(child: Text('No more users')),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () => _handleSwipe(false),
  //                     child: const Text('Dislike'),
  //                   ),
  //                   ElevatedButton(
  //                     onPressed: () => _handleSwipe(true),
  //                     child: const Text('Like'),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
