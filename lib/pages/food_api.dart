import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modernlogintute/pages/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/search', {"limit": "18", "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "56d2579a54mshfa1571f69b5a733p1b24cejsnd776c4297656",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed'] ?? {}) {
      if (i['type'] == "single recipe") {
        _temp.add(i['content']['details']);
      }
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
