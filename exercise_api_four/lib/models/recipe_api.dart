import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exercise_api_four/models/recipe.dart';

class RecipeApi {

/// this is from yummly api     ( Node.js) Unirest
  /*const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");
  req.query({
  "limit": "24",
  "start": "0"
  });
  req.headers({
  "X-RapidAPI-Key": "0c44c4e922msh5d1983b452b1738p14d833jsn624a75d62ec9",
  "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
  "useQueryString": true
  });
*/


  static Future<List<Recipe>> getRecipe() async {
    /// authority is host name => yummly2.p.rapidapi.com
    /// unencodedPath is the path for the api => /feeds/list

    /// map req.query is passed as list also!!!
    // req.query({
    //   "limit": "24",
    //   "start": "0"
    //   });
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": "24", "start": "0","tag": "list.recipe.popular"});

    // X-RapidApi-Key => your api key from yummly api

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "0c44c4e922msh5d1983b452b1738p14d833jsn624a75d62ec9",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
