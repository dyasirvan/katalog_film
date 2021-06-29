import 'package:flutter/material.dart';
import 'package:katalog_film/detail_page.dart';
import 'package:katalog_film/model/film.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      Expanded(
                        child: Container(
                          height: 50,
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
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height,
                  child: _film.length > 0
                    ? ListView.builder(
                    itemBuilder: (context, index){
                      // final Film film  = filmList[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailPage(film: _film[index]);
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      _film[index].gambarPoster,
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        _film[index].judul,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        _film[index].tglRilis,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: _film.length,
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
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}