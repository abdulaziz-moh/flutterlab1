import 'package:flutter/material.dart';

const Color facebookBlue = Color(0xFF1877F2);
const Color facebookGrey = Color(0xFFF0F2F5);
const Color facebookWhite = Color(0xFFFFFFFF);

/// --------------------
/// Dummy Data Model
/// --------------------
class Post {
  final String userName;
  final String time;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;

  Post({
    required this.userName,
    required this.time,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });
}

/// Dummy posts list
final List<Post> dummyPosts = [
  Post(
    userName: "Abdulaziz",
    time: "5m",
    content: "Building a Facebook UI with Flutter 🚀",
    imageUrl: "https://picsum.photos/600/400?random=1",
    likes: 120,
    comments: 40,
  ),
  Post(
    userName: "Flutter Dev",
    time: "10m",
    content: "Flutter makes UI development fun!",
    imageUrl: "https://picsum.photos/600/400?random=2",
    likes: 98,
    comments: 22,
  ),
  Post(
    userName: "ALX Student",
    time: "1h",
    content: "Consistency beats talent 💪",
    imageUrl: "https://picsum.photos/600/400?random=3",
    likes: 210,
    comments: 60,
  ),
  // MARK: 5 New Dummy Data Entries Added Below
  Post(
    userName: "Dart Enthusiast",
    time: "2h",
    content: "Null safety in Dart is a game-changer.",
    imageUrl: "https://picsum.photos/600/400?random=4",
    likes: 55,
    comments: 15,
  ),
  Post(
    userName: "UI/UX Designer",
    time: "4h",
    content: "Minimalist designs are elegant and functional.",
    imageUrl: "https://picsum.photos/600/400?random=5",
    likes: 320,
    comments: 85,
  ),
  Post(
    userName: "Widget Master",
    time: "8h",
    content: "CustomPaint is so powerful for drawing anything.",
    imageUrl: "https://picsum.photos/600/400?random=6",
    likes: 150,
    comments: 30,
  ),
  Post(
    userName: "Flutter Community",
    time: "12h",
    content: "The recent update improved performance significantly!",
    imageUrl: "https://picsum.photos/600/400?random=7",
    likes: 500,
    comments: 110,
  ),
  Post(
    userName: "Mobile Developer",
    time: "1d",
    content: "Cross-platform development is the future. #Flutter",
    imageUrl: "https://picsum.photos/600/400?random=8",
    likes: 450,
    comments: 95,
  ),
];


/// --------------------
/// Home Screen
/// --------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: facebookWhite,
        appBar: _buildAppBar(),
        body: const TabBarView(
          children: [
            _HomeFeed(),
            Center(child: Text("Videos")),
            Center(child: Text("Groups")),
            Center(child: Text("Marketplace")),
            Center(child: Text("Notifications")),
            Center(child: Text("Profile")),
          ],
        ),
      ),
    );
  }
}

/// --------------------
/// AppBar + Tabs (NO animation)
/// --------------------
AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    // elevation: 1,
    title: const Text(
      "facebook",
      style: TextStyle(
        color: facebookBlue,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      // const Icon(Icons.add_box_rounded, color: Colors.black, size: 28),
      // const SizedBox(width: 10),
      // const Icon(Icons.search, color: Colors.black, size: 28),
      // const SizedBox(width: 10),
      // const Icon(Icons.message, color: Colors.black, size: 28),
      // const SizedBox(width: 10),

      IconButton(
        icon: const Icon(Icons.add_box_rounded, color: Colors.black, size: 28),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.search, color: Colors.black, size: 28),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.message, color: Colors.black, size: 28),
        onPressed: () {},
      ),
    ],
    bottom: const TabBar(
      indicatorColor: facebookBlue,
      indicatorWeight: 3,
      labelColor: facebookBlue,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(icon: Icon(Icons.home, size: 28)),
        Tab(icon: Icon(Icons.ondemand_video, size: 28)),
        Tab(icon: Icon(Icons.people, size: 28)),
        Tab(icon: Icon(Icons.storefront, size: 28)),
        Tab(icon: Icon(Icons.notifications, size: 28)),
        // Tab(icon: Icon(Icons.menu, size: 28)),
        CircleAvatar(
          backgroundColor: Colors.blueGrey,
          backgroundImage: NetworkImage("https://picsum.photos/600/400?random=100"),
          child: Icon(Icons.person, color: Colors.white ,size: 24)
        ),
      ],
    ),
  );
}

/// --------------------
/// Home Feed (Separated Widget)
/// --------------------
class _HomeFeed extends StatelessWidget {
  const _HomeFeed();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyPosts.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) return _buildStatusInput();
        if (index == 1) return _buildStoriesBar();
        return _buildPostCard(dummyPosts[index - 2]);
      },
    );
  }
}

/// --------------------
/// Status Input
/// --------------------
Widget _buildStatusInput() {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.blueGrey,
          backgroundImage: NetworkImage(
            "https://picsum.photos/600/400?random=100",
          ),
          // child: Image.network(
          //   "https://picsum.photos/600/400?random=1",
          //   height: 110,
          //   width: 100,
          //   fit:BoxFit.fill,
          //   ),

          // Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What's on your mind?",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.image, color: Colors.green),
      ],
    ),
  );
}

/// --------------------
/// Stories Bar
/// --------------------
Widget _buildStoriesBar() {
  return Container(
    height: 180,
    color: Colors.white,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Container(
          width: 110,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: Image.network(
              "https://picsum.photos/600/400?random=${50 - index}",
              height: 166,
              width: 110,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 166,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 230,
                  child: Center(child: Icon(Icons.broken_image)),
                );
              },
            ),
          ),

          // const Center(child: Text("Story")),
        );
      },
    ),
  );
}

/// --------------------
/// Post Card (Uses Dummy Model)
/// --------------------
Widget _buildPostCard(Post post) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    elevation: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            backgroundImage: NetworkImage(post.imageUrl),
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(post.userName),
          subtitle: Text(post.time),
          trailing: const Icon(Icons.more_horiz),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(post.content),
        ),
        // Container(
        //   height: 230,
        //   color: Colors.grey.shade300,
        //   child: const Center(
        //     child: Icon(Icons.image, size: 60, color: Colors.grey),
        //   ),
        // ),
        Image.network(
          post.imageUrl,
          height: 230,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              height: 230,
              child: Center(child: Icon(Icons.broken_image)),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${post.likes} Likes"),
              Text("${post.comments} Comments"),
            ],
          ),
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _PostAction(icon: Icons.thumb_up_alt_outlined, label: "Like"),
            _PostAction(icon: Icons.chat_bubble_outline, label: "Comment"),
            _PostAction(icon: Icons.share_outlined, label: "Share"),
          ],
        ),
      ],
    ),
  );
}

/// --------------------
/// Post Action Button
/// --------------------
class _PostAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PostAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey),
      label: Text(label, style: const TextStyle(color: Colors.grey)),
    );
  }
}
