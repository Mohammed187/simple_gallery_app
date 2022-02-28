import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required Photo post, required this.onTap})
      : _post = post,
        super(key: key);

  final Photo _post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17.0,
                backgroundImage: NetworkImage(_post.downloadUrl),
              ),
              const SizedBox(width: 5.0),
              Text(_post.author),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
          Hero(
            tag: _post.id,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                _post.downloadUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.save_outlined)),
            ],
          ),
          Row(
            children: [
              Text(_post.author),
              const SizedBox(width: 10.0),
              Text(_post.url),
            ],
          ),
          const Center(
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none, hintText: 'add comment'),
            ),
          ),
          const Text('5 mins ago'),
        ],
      ),
    );
  }
}
