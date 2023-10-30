import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedesignapp/data/entity/movieModel.dart';
import 'package:moviedesignapp/data/repo/movierepo.dart';

class HomeCubit extends Cubit<List<Movie>> {

  HomeCubit() : super(<Movie>[]);

  var mrepo = MovieRepo();

  Future<void> getMovies () async{
    var list = await mrepo.getMovies();
    emit(list);
  }


}