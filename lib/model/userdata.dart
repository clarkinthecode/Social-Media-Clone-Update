import 'account.dart';
import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';

class Userdata {
  Account myUserAccount = Account(
    name: 'Clark Vincent Salas',
    email: 'clarkvincentsalas@gmail.com',
    img: 'assets/clark_profile.jpg',
    numFollowers: '15',
    numPosts: '350',
    numFollowing: '150',
  );

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/friend_alice.jpg',
      commenterName: 'Alice',
      commenterTime: '15m',
      commenterContent: 'Looks so delicious! Save a slice for me!',
    ),
  ];

  late List<Userpost> userList;

  List<Friend> friendList = [
    Friend(img: 'assets/friend_alice.jpg', name: 'Alice'),
    Friend(img: 'assets/friend_bob.jpg', name: 'Bob'),
    Friend(img: 'assets/friend_charlie.jpg', name: 'Charlie'),
    Friend(img: 'assets/friend_diana.jpg', name: 'Diana'),
    Friend(img: 'assets/friend_ethan.jpg', name: 'Ethan'),
    Friend(img: 'assets/friend_michael.jpg', name: 'Michael'),
  ];

  Userdata() {
    userList = [
      Userpost(
        userimg: 'assets/clark_profile.jpg',
        username: 'Clark Vincent Salas',
        time: 'Just now',
        postcontent: 'Triple Chocolate Fudge Cake with fresh strawberries! A decadent, multi-layered chocolate cake enrobed in silky dark chocolate ganache.',
        postimg: 'assets/pavlova.jpg',
        numcomments: '2',
        numshare: '15',
        isliked: true,
        comments: [
          Usercomment(
            commenterImg: 'assets/friend_alice.jpg',
            commenterName: 'Alice',
            commenterTime: '15m',
            commenterContent: 'Looks so delicious! Save a slice for me!',
          ),
          Usercomment(
            commenterImg: 'assets/friend_bob.jpg',
            commenterName: 'Bob',
            commenterTime: '8m',
            commenterContent: 'Master chef Salas at work! Outstanding recipe!',
          ),
        ],
      ),
      Userpost(
        userimg: 'assets/friend_alice.jpg',
        username: 'Jane Smith',
        time: '3 hrs ago',
        postcontent: 'Lovin the new cafe in town',
        postimg: 'assets/cafe.jpg',
        numcomments: '1',
        numshare: '5',
        isliked: false,
        comments: [
          Usercomment(
            commenterImg: 'assets/friend_alice.jpg',
            commenterName: 'Jane Smith',
            commenterTime: '6 hrs',
            commenterContent: 'Wow Beautiful!',
          ),
        ],
      ),
      Userpost(
        userimg: 'assets/friend_bob.jpg',
        username: 'John Doe',
        time: '5 hrs ago',
        postcontent: 'Had a great day at the beach!',
        postimg: 'assets/beach.jpg',
        numcomments: '0',
        numshare: '5',
        isliked: false,
        comments: [],
      ),
    ];
  }
}
