import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedesignapp/ui/cubit/homeCubit.dart';
import 'package:moviedesignapp/ui/views/movieDetailPage.dart';

import '../../data/entity/movieModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler",style: TextStyle(fontSize: 24),),
      ),
      body:BlocBuilder<HomeCubit,List<Movie>>(
          builder: (context,list){
            if(list.isNotEmpty) {
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (0.5),
                padding: const EdgeInsets.all(6),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(list.length, (index)  {
                  var movie = list[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetail(movie: movie))).then((value){
                        context.read<HomeCubit>().getMovies();
                      });
                    },
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 300,
                            child: Image.asset("images/${movie.movieImage}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${movie.moviePrice} ₺",style:const TextStyle(fontSize: 20),),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor : Colors.grey.shade200),
                                  onPressed: (){
                                  print("Sepete eklendi.");
                                }, child: const Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child:  Text("Sepet",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                                ))

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
            }
            else{
              return const Center();
            }
          }) ,
    );
  }
}
