import 'package:flutter/material.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import '../model/usercomment.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userPost,
    required this.userData,
  });

  final Userpost userPost;
  final Userdata userData;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _commentController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final TextStyle nametxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  final TextStyle boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final newComment = Usercomment(
      commenterImg: widget.userData.myUserAccount.img,
      commenterName: widget.userData.myUserAccount.name,
      commenterTime: 'Just now',
      commenterContent: text,
    );

    setState(() {
      widget.userPost.comments.add(newComment);
      widget.userPost.numcomments = widget.userPost.comments.length.toString();
      widget.userData.commentList.add(newComment);
      _commentController.clear();
    });

    // Auto-scroll to bottom of comments
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget commentBtn(Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(userComment.commenterTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDesc(Usercomment userComment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commenterName, style: boldtxtStyle),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(child: Text(userComment.commenterContent)),
          ],
        ),
      ],
    ),
  );

  Widget commentSpace(Usercomment userComment) => Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: commentDesc(userComment),
  );

  Widget commenterPic(Usercomment userComment) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CircleAvatar(
      backgroundImage: AssetImage(userComment.commenterImg),
      radius: 20,
    ),
  );

  Widget usercommenterline(Userpost userPost, Usercomment userComment) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      commenterPic(userComment),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commentSpace(userComment),
            commentBtn(userComment),
          ],
        ),
      ),
    ],
  );

  Widget userpostdetails(Usercomment userComment) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      usercommenterline(widget.userPost, userComment),
    ],
  );

  Widget commenters(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('${userPost.numshare} Shares', style: boldtxtStyle),
          ],
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments (${userPost.comments.length})', style: boldtxtStyle1),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    ],
  );

  Widget buttons(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isliked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  userPost.isliked = !userPost.isliked;
                });
              },
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    ],
  );

  Widget userline(Userpost userPost) => Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userPost.userimg),
          radius: 20,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userPost.time),
              const Text(' . '),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: Text(userPost.postcontent)),
          ],
        ),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            userPost.postimg,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    ),
  );

  Widget commentInputField() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(0, 0, 0, 0.08),
          offset: const Offset(0, -2),
          blurRadius: 4,
        ),
      ],
    ),
    child: SafeArea(
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(widget.userData.myUserAccount.img),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Write a comment...',
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => _addComment(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: _addComment,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              children: [
                userline(widget.userPost),
                postimage(widget.userPost),
                buttons(widget.userPost),
                commenters(widget.userPost),
                ...widget.userPost.comments.map((userComment) => userpostdetails(userComment)),
                const SizedBox(height: 20),
              ],
            ),
          ),
          commentInputField(),
        ],
      ),
    );
  }
}
