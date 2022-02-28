import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/posts_api.dart';
import 'package:flutter_application_1/app_data.dart';
import 'package:flutter_application_1/components/post.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/model/photo.dart';
import 'package:flutter_application_1/pages/details_page.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Gallery'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.post_add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.message_outlined)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          NetworkImage(AppData.profilePicsList[index]),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SizedBox(
                child: FutureBuilder<List<Photo>>(
                  future: fetchPhotos(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            'Error has occures, ' + snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Post(
                            post: snapshot.data![index],
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(photo: snapshot.data![index]),
                                )),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: whiteColor,
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showUnselectedLabels: false,
          onTap: onItemTapped,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined), label: 'Reels'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: 'Store'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(AppData.profilePicsList[0]),
                ),
                label: 'Profile'),
          ]),
    );
  }
}
