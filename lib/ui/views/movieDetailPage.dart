import 'package:flutter/material.dart';

import '../../data/entity/movieModel.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;

  const MovieDetail({super.key, required this.movie});


  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.movieName ,style: TextStyle(fontSize: 24),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox( width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2.5,
                child: Image.asset("images/${widget.movie.movieImage}")),
            Text(widget.movie.moviePrice.toString() + " ₺",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
