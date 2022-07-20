import 'package:exercise_api_four/models/recipe_api.dart';
import 'package:exercise_api_four/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("food recipe"),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context,index){
          return RecipeCard(
              title: _recipes[index].name!,
              rating: _recipes[index].rating. toString(),
              cookTime: _recipes[index].totalTime!,
              thumbnailUrl: _recipes[index].images!
          );
        },
      ),
    );
  }
}
