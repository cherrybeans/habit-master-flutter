import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:habit_master/category_menu.page.dart';
import 'package:habit_master/home.page.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'login.page.dart';
import 'model/model.dart';
import 'supplemental/cut_corners_border.dart';

class HabitsApp extends StatefulWidget {
  const HabitsApp({Key? key, required this.client}) : super(key: key);
  final ValueNotifier<GraphQLClient> client;

  @override
  _HabitsAppState createState() => _HabitsAppState();
}

class _HabitsAppState extends State<HabitsApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: widget.client,
        child: MaterialApp(
          title: 'Habit Master',
          theme: _kHabitTheme,
          home: Backdrop(
            currentCategory: _currentCategory,
            frontLayer: HomePage(category: _currentCategory),
            backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap),
            frontTitle: Text('HABIT MASTER'),
            backTitle: Text('MENU'),
          ),
          initialRoute: '/login',
          onGenerateRoute: _getRoute,
        ));
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _kHabitTheme = _buildHabitThemePink();

ThemeData _buildHabitThemePink() {
  final cutCornersShape = MaterialStateProperty.all(
    BeveledRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
    ),
  );
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kHabitPink100,
      onPrimary: kHabitBrown900,
      secondary: kHabitBrown900,
      error: kHabitErrorRed,
    ),
    textTheme: _buildHabitTextTheme(base.textTheme),
    primaryTextTheme: _buildHabitTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kHabitPink100,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(shape: cutCornersShape),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(shape: cutCornersShape),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kHabitPink400,
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildHabitTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kHabitBrown900,
        bodyColor: kHabitBrown900,
      );
}

ThemeData _buildHabitThemePurple() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kHabitPurple,
      secondary: kHabitPurple,
      error: kHabitErrorRed,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),
    scaffoldBackgroundColor: kHabitSurfaceWhite,
    textTheme: _buildHabitTextTheme(base.textTheme),
    primaryTextTheme: _buildHabitTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kHabitPurple,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kHabitPurple,
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}
