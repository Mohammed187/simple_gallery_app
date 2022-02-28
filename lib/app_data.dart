class AppData {
  static const profilePicsList = [
    'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/library/wp-content/uploads/2015/03/adjust-tie.jpeg',
    'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg',
    'https://i.pinimg.com/564x/7f/ed/d8/7fedd865ab68b401303c07d61f64be97.jpg',
    'https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/joelvalve-572557-unsplash.jpg',
  ];

  static List<PostData> posts = <PostData>[
    PostData(
      name: 'Username',
      image:
          'https://i.pinimg.com/564x/97/54/62/975462e13783c1bfde681b499a10c8be.jpg',
      caption: 'this is my caption',
      time: '1',
    ),
    PostData(
      name: 'Username',
      image:
          'https://i.pinimg.com/564x/97/54/62/975462e13783c1bfde681b499a10c8be.jpg',
      caption: 'this is my caption',
      time: '4',
    ),
    PostData(
      name: 'Username',
      image:
          'https://i.pinimg.com/564x/97/54/62/975462e13783c1bfde681b499a10c8be.jpg',
      caption: 'this is my caption',
      time: '6',
    ),
    PostData(
      name: 'Username',
      image:
          'https://i.pinimg.com/564x/97/54/62/975462e13783c1bfde681b499a10c8be.jpg',
      caption: 'this is my caption',
      time: '8',
    ),
    PostData(
      name: 'Username',
      image:
          'https://i.pinimg.com/564x/97/54/62/975462e13783c1bfde681b499a10c8be.jpg',
      caption: 'this is my caption',
      time: '9',
    ),
  ];
}

class PostData {
  String name;
  String image;
  String caption;
  String time;

  PostData(
      {required this.name,
      required this.image,
      required this.caption,
      required this.time});
}
