import 'package:flutter/material.dart';
import 'package:katalog_film/detail_page.dart';
import 'package:katalog_film/model/film.dart';
import 'package:katalog_film/search_page.dart';
import 'package:katalog_film/user_profile_page.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth <= 600) {
            return FilmGrid(gridCount: 2);
          }else if(constraints.maxWidth <= 1200){
            return FilmGridWeb(gridCount: 4,);
          }else{
            return FilmGridWeb(gridCount: 6,);
          }
        },
      )
    );
  }
}

class FilmGridWeb extends StatefulWidget{
  final int gridCount;
  FilmGridWeb({required this.gridCount});

  @override
  _FilmGridWebState createState() => _FilmGridWebState();
}

class _FilmGridWebState extends State<FilmGridWeb> {
  List<Film> _film = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _film = filmList;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Film> results = [];
    if (enteredKeyword.isEmpty) {
      results = filmList;
    } else {
      results = filmList
          .where((film) =>
          film.judul.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // refresh the UI
    setState(() {
      _film = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var _crossAxisSpacing = 8;
    var _screenWidth = size.width;
    var _crossAxisCount = 2;
    var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = _screenWidth <= 1200 ? 900 : 1200;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF227093),
                Color(0xFF34ace0)
              ]
          )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hi, Dyas",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return UserProfilePage();
                        }));
                      },
                      child: Icon(Icons.account_circle, color: Colors.white,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value){
                  _runFilter(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(40.0),
                    ),
                    hintText: 'Search Movie by Title',
                    fillColor: Colors.white,
                    filled: true
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _film.length > 0
                  ? GridView.count(
                // childAspectRatio: itemWidth / (size.height - 250),
                childAspectRatio: _width /cellHeight,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: _film.map((film) {
                  int skor = (film.skor * 10).round();
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailPage(film: film);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  film.gambarPoster,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4.0, left: 4.0),
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '$skor%',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: skor >= 80 ? Color(0xFF6ab04c)
                                        : skor >= 60 ? Color(0xFFf9ca24)
                                        : Color(0xFFeb4d4b),
                                    shape: BoxShape.circle
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              film.judul,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
                crossAxisCount: widget.gridCount,
              )
                  : Text(
                    "No result found",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white
                    ),
                  ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}

class FilmGrid extends StatelessWidget{
  final int gridCount;

  FilmGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF227093),
            Color(0xFF34ace0)
          ]
        )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                margin: EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hi, Dyas",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserProfilePage();
                          }));
                        },
                        child: Icon(Icons.account_circle, color: Colors.white,))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(40.0),
                        borderSide: BorderSide(
                          color:Colors.white70,
                          width: 2,
                        )
                    ),
                    enabled: false,
                    hintText: 'Search Movie by Title',
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: (itemWidth / itemHeight),
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: filmList.map((film) {
                  int skor = (film.skor * 10).round();
                  return InkWell(
                    onTap: () {
                      // Fluttertoast.showToast(
                      //   msg: film.judul,
                      //   toastLength: Toast.LENGTH_SHORT,
                      //   gravity: ToastGravity.BOTTOM, // Also possible "TOP" and "CENTER"
                      //   backgroundColor: Colors.white,
                      //   textColor: Colors.black,);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailPage(film: film);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    film.gambarPoster,
                                    fit: BoxFit.cover,
                                    height: 500,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4.0, left: 4.0),
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '$skor%',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: skor >= 80 ? Color(0xFF6ab04c)
                                          : skor >= 60 ? Color(0xFFf9ca24)
                                          : Color(0xFFeb4d4b),
                                      shape: BoxShape.circle
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                film.judul,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }

}