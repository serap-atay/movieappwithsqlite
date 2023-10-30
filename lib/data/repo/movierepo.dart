import '../../sqlite/sqliteHelper.dart';
import '../entity/movieModel.dart';

class MovieRepo{

  Future<List<Movie>> getMovies() async{
      var db = await SqliteHelper.databaseAccess();
      List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Movies");
      return List.generate(maps.length, (index)  {
        return Movie(movieId: maps[index]["movieId"], movieName: maps[index]["movieName"], movieImage: maps[index]["movieImage"], moviePrice: maps[index]["moviePrice"]);
      });
    }
}