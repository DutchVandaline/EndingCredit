import 'package:endingcredit/DataBase/MovieNotifier.dart';
import 'package:endingcredit/Screens/SearchScreen.dart';
import 'package:endingcredit/Screens/WantMovieListScreen.dart';
import 'package:endingcredit/Widgets/MemoTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String deleteId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.all(3.0),
            color: Theme.of(context).accentColor,
            child:
                Text("엔딩 크레딧", style: Theme.of(context).textTheme.headline1)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WantMovieListScreen()));
            },
            icon: Icon(
              Icons.lightbulb_outline,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15.0)),
                width: double.infinity,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "메모를 남기고 싶은 영화를 검색하세요",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: FutureBuilder(
              future: Provider.of<MovieNotifier>(context, listen: false)
                  .getWatchedOrWant(1),
              builder: (context, snap) {
                return Consumer<MovieNotifier>(
                    builder: (context, movieData, child) {
                  return movieData.movies.length <= 0
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(
                            '메모를 지금바로 추가해보세요\n추가된 메모를 꾹 누르면 삭제할 수 있습니다.',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: movieData.movies.length,
                          itemBuilder: (context, index) {
                            final i = index;
                            final movieItem = movieData.movies[i];

                            return MemoTile(
                              movie: movieItem,
                            );
                          });
                });
              },
            ))
          ],
        ),
      ),
    );
  }
}
