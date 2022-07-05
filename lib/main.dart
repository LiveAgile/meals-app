import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/category_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Raleway",
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.pink,
            onPrimary: Colors.black,
            secondary: Colors.amber,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.black,
            background: Colors.grey,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      routes: {
        "/": (_) => const TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => const MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen()
      },
    );
  }
}
