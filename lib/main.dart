import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class NewsArticle {
  final String content;
  final String title;
  final String thumbnail;

  NewsArticle({
    required this.content,
    required this.title,
    required this.thumbnail,
  });
}

class MyApp extends StatelessWidget {
  final List<NewsArticle> newsArticles = [
    NewsArticle(
      content: 'https://today.thefinancialexpress.com.bd/first-page/economic-diplomacy-would-be-major-focus-1705255002',
      title: 'Economy',
      thumbnail: 'https://today.thefinancialexpress.com.bd/uploads/1705255002.jpg',
    ),
    NewsArticle(
      content: 'https://www.newagebd.net/article/222858/jp-leaders-blast-gm-quader-chunnu',
      title: 'Politics',
      thumbnail: 'https://www.newagebd.com/files/records/news/202401/222858_190.jpg',
    ),
    NewsArticle(
      content: 'https://www.who.int/news/item/15-01-2024-who-launches-appeal-for-key-emergencies-in-2024',
      title: 'Health',
      thumbnail: 'https://cdn.who.int/media/images/default-source/who_homepage/blood-pressure-at-cholera-treatment-centre-sudan.tmb-1366v.jpg?sfvrsn=1aceaf2f_2',
    ),
    NewsArticle(
      content: 'https://www.dhakatribune.com/bangladesh/dhaka/336791/aqi-dhaka-air-third-worst-in-world-on-monday',
      title: 'Environment',
      thumbnail: 'https://ecdn.dhakatribune.net/contents/cache/images/900x506x1/uploads/media/2023/11/22/dhaka-air-quality-ee4d5cc07774821ed6bddb2d018f866a.jpg?jadewits_media_id=9631',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;
            return isPortrait
                ? ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                return NewsItem(newsArticle: newsArticles[index]);
              },
            )
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                return NewsItem(newsArticle: newsArticles[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final NewsArticle newsArticle;

  const NewsItem({Key? key, required this.newsArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            newsArticle.thumbnail,
            fit: BoxFit.cover,
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsArticle.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Content: ${newsArticle.content}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
