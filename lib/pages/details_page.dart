import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapi_app/models/news_model.dart';
import 'package:url_launcher/link.dart';

class DetailsPage extends StatelessWidget {
  final Articles news;
  const DetailsPage(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime datePublished = DateTime.parse(news.publishedAt);
    String dt = DateFormat('yMMMMEEEEd').format(datePublished);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News'),
      ),
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            Text(
              news.title,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              dt,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.network(news.urlToImage ?? ''),
            const SizedBox(height: 20),
            Text(
              news.content,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Link(
              target: LinkTarget.blank,
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text(
                  'Full article',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              uri: Uri.parse(news.url),
            ),
          ],
        ),
      ),
    );
  }
}
