import 'package:endingcredit/DataBase/DataBase.dart';
import 'package:endingcredit/DataBase/MovieNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletePopUP extends StatelessWidget {
  final Movie inputMovie;
  DeletePopUP({this.inputMovie});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF222222),
      title: Text(
        '삭제 경고',
        style: TextStyle(color: Colors.white),
      ),
      content: Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다.",
          style: TextStyle(color: Colors.white)),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pop(context, "삭제");
            Provider.of<MovieNotifier>(context, listen: false)
                .deleteMovie(inputMovie.id);
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 20.0, right: 25.0, left: 10.0),
            child: Text('삭제',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'NanumGothicCoding')),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context, "취소");
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 20.0, right: 25.0, left: 10.0),
            child: Text('취소',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'NanumGothicCoding')),
          ),
        ),
      ],
    );
  }
}
