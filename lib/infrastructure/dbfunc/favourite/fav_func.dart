import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/Allsongs/model/allSongModel.dart';
import '../../../domain/Favourite/model/model.dart';
import '../../functions/fetchsongs.dart';

ValueNotifier<List<Songs>> favarotList = ValueNotifier([]);

Future<void> addFavourat(Songs songs)async{
favarotList.value.insert(0, songs);
 Box <Favmodel>favDB=await Hive.openBox<Favmodel>('Favarout');
 Favmodel temp=Favmodel(id: songs.id);
 await favDB.add(temp);
 favarotList.notifyListeners();
  getFAvourite();

}


getFAvourite() async {
  favarotList.value.clear();
  List<Favmodel> favSongCheck = [];
  final favDb = await Hive.openBox<Favmodel>('Favarout');
  favSongCheck.addAll(favDb.values);
  for (var favs in favSongCheck) {
    int count = 0;
    for (var songs in allSongs) {
      if (favs.id == songs.id) {
        favarotList.value.add(songs);
        break;
      } else {
        count++;
      }
    }
    if (count == allSongs.length) {
      var key = favs.key;
      favDb.delete(key);
    }
  }
  favarotList.notifyListeners();
}
  
removeFavourite(Songs song) async {
  favarotList.value.remove(song);
  List<Favmodel> templist = [];
  Box<Favmodel> favdb = await Hive.openBox('Favarout');
  templist.addAll(favdb.values);
  for (var element in templist) {
    if (element.id == song.id) {
      var key = element.key;
      favdb.delete(key);
      break;
    }
  }
  favarotList.notifyListeners();
  getFAvourite();
}