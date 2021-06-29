import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katalog_film/model/film.dart';

class DetailPage extends StatelessWidget{
  final Film film;
  DetailPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth <= 600) {
            return DetailMobilePage(film: film);
          }else if(constraints.maxWidth <= 1200){
            return DetailWebPage(film: film,);
          }else{
            return DetailWebPage(film: film,);
          }
        }
    );
  }

}

class DetailWebPage extends StatelessWidget{
  final Film film;
  DetailWebPage({required this.film});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int skor = (film.skor * 10).round();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // for background
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(film.gambarBackdrop),
                fit: BoxFit.cover
              ),
            ),
          ),
          // set color image
          Container(
              height: size.height,
              width: size.width,
              color: Color.fromARGB(1000, 8, 8, 8)
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 100),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 64, right: 32),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            film.gambarPoster,
                            width: 250,
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
                    padding: const EdgeInsets.only(right: 64, left: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          width: size.width - 250 - 32 - 32 - 64 - 64,
                          child: Text(
                            film.judul,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 32
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          width: size.width - 250 - 32 - 32 - 64 - 64,
                          child: Text(
                            '${film.tglRilis} ${String.fromCharCode(0x2022)} ${film.genre}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 24),
                          width: size.width - 250 - 32 - 32 - 64 - 64,
                          child: Text(
                            film.status,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white
                            ),
                          ),
                        ),
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 24
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          width: size.width - 250 - 32 - 32 - 64 - 64,
                          child: Text(
                            film.deskripsi,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}

class DetailMobilePage extends StatelessWidget {
  final Film film;
  DetailMobilePage({required this.film});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width - 16 - 16 - 20 - 24,
                        child: Text(
                          film.judul,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                  film.gambarPoster,
                                  width: 150,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.0, left: 4.0),
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              film.skor.toString()
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: MediaQuery.of(context).size.width - 16 - 16 - 8 - 150,
                            child: Text(
                              film.judul,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            width: MediaQuery.of(context).size.width - 16 -16 - 8 - 150,
                            child: Text(
                              film.genre,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 4),
                            child: Text(
                              film.tglRilis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Text(
                            film.status,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Overview",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      film.deskripsi,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}