import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/posts_api.dart';
import 'package:flutter_application_1/model/photo.dart';

import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required Photo photo})
      : _photo = photo,
        super(key: key);

  final Photo _photo;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop()),
            title: Text(widget._photo.author),
            floating: true,
            flexibleSpace: Image(
              image: NetworkImage(widget._photo.downloadUrl),
              fit: BoxFit.cover,
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => FutureBuilder<List<Photo>>(
                  future: fetchPhotos(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            'Error has occures, ' + snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![index].downloadUrl),
                        ),
                        title: Text(snapshot.data![index].author),
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(photo: snapshot.data![index]),
                            )),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
