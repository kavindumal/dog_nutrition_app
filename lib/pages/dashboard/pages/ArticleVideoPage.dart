import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleVideoPage extends StatefulWidget {
  final String title;
  final String description;
  final String videoUrl; // YouTube video URL or article link

  const ArticleVideoPage({
    super.key,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  @override
  _ArticleVideoPageState createState() => _ArticleVideoPageState();
}

class _ArticleVideoPageState extends State<ArticleVideoPage> {
  bool isLiked = false;
  bool isBookmarked = false;

  // Toggle like
  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  // Toggle bookmark
  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  // Launch video or article URL in the browser
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.amber : Colors.black,
            ),
            onPressed: _toggleBookmark,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Video section with a play button to launch video in browser
  Widget _buildVideoSection() {
    return GestureDetector(
      onTap: () => _launchURL(widget.videoUrl),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300], // Placeholder for video thumbnail
            child: Icon(Icons.play_circle_filled, size: 80, color: Colors.white),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              'Watch on YouTube',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Like and share buttons
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined),
                color: isLiked ? Colors.blue : Colors.black,
                onPressed: _toggleLike,
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: _shareContent,
              ),
            ],
          ),
          const Text(
            '100 Likes',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ), // Example: display likes count
        ],
      ),
    );
  }

  // Function to share content via system's share menu
  void _shareContent() {
    // For sharing functionality, you can use packages like share_plus or similar.
    print('Share this article/video');
  }
}
