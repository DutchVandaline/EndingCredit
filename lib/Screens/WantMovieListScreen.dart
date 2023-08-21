import 'package:endingcredit/DataBase/MovieNotifier.dart';
import 'package:endingcredit/Widgets/MovieWatchStateViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SearchScreen_for_Subscreen.dart';

class WantMovieListScreen extends StatefulWidget {
  @override
  _WantMovieListScreenState createState() => _WantMovieListScreenState();
}

class _WantMovieListScreenState extends State<WantMovieListScreen> {
  final myController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String movieTitle = '';
  String localTitle = '';
  String deleteId = '';
  String localId = '';
  String localMemo = '';
  String localOneLineText = '';
  String localEditTime = '';
  double localRating = 0.0;
  String movieOriginalTitle = '';
  int memoState = 0;
  int watchState = 0;
  int wantOrget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(3.0),
              color: Theme.of(context).accentColor,
              child: Text(
                " 보고 싶은 영화 ",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 20.0),
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.remove,
            color: Colors.transparent,
          ),
          Icon(
            Icons.remove,
            color: Colors.transparent,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 1.0, left: 8.0, right: 8.0, bottom: 8.0),
            child: InkWell(
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
                      "보고 싶은 영화를 검색하세요",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScreen_for_Subscreen(
                              watch: false,
                            )));
              },
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: Provider.of<MovieNotifier>(context).getWatchedOrWant(0),
            builder: (context, AsyncSnapshot snapshot) {
              return Consumer<MovieNotifier>(
                  builder: (context, movieData, child) {
                return movieData.movies.length <= 0
                    ? Container(
                        alignment: Alignment.center,
                        child: Text(
                          '보고 싶은 영화를 추가해보세요.',
                          style: TextStyle(
                              color: Colors.grey, fontFamily: 'NanumMyeongjo'),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: movieData.movies.length,
                        itemBuilder: (context, index) {
                          final i = index;
                          final movieItem = movieData.movies[i];
                          return MovieWatchStateViewWidget(
                            movie: movieItem,
                          );
                        });
              });
            },
          )),
        ],
      ),
    );
  }

}
