import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vst_app/screens/article_screen.dart';
import 'package:vst_app/widgets/image_container.dart';

import '../models/article_models.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['All', 'Article', 'NewsPaper', 'Video', 'Stats'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        extendBodyBehindAppBar: true,
        body: ListView(
          padding: const EdgeInsets.only(top: 120.0, left: 10),
          children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)],
        ),
      ),
    );
    ;
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    super.key,
    required this.tabs,
  });
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: tabs
                .map((tab) => Tab(
                      icon: Text(
                        tab,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList()),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: tabs
                  .map((tab) => ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ArticleScreen.routeName,
                                  arguments: articles[index]);
                            },
                            child: Row(
                              children: [
                                ImageContainer(
                                  width: 80,
                                  height: 80,
                                  imageUrl: articles[index].imageUrl,
                                  borderRadius: 5,
                                  margin: const EdgeInsets.all(10.0),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.schedule,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago'),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        const Icon(Icons.visibility),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text('${articles[index].views} views')
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                  .toList()),
        )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon:
                    const RotatedBox(quarterTurns: 1, child: Icon(Icons.tune)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}
