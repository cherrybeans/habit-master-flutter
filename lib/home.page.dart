import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'create-edit-habit.page.dart';
import 'graphql/habits_graphql_api.graphql.dart';
import 'model/model.dart';

class HomePage extends StatefulWidget {
  final Category category;

  const HomePage({Key? key, this.category = Category.all}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _habits = <AllHabits$Query$HabitType?>[];

  @override
  void initState() {
    super.initState();
    _habits.addAll([]); // Find out how to run graphql query to get data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Backdrop(
                  // Not main backdrop place
                  // TODO: Make currentCategory field take _currentCategory (104)
                  currentCategory: Category.all,
                  // TODO: Pass _currentCategory for frontLayer (104)
                  frontLayer: CreateEditHabitPage(),
                  // TODO: Change backLayer field value to CategoryMenuPage (104)
                  backLayer: Container(color: kHabitPink100),
                  frontTitle: Text('HABIT MASTER'),
                  backTitle: Text('MENU'),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      // TODO: Filter habits by status chosen (category)
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return RefreshIndicator(
        onRefresh: _refreshList,
        strokeWidth: 3,
        child: Query(
          options: QueryOptions(
              document: AllHabitsQuery().document,
              fetchPolicy: FetchPolicy.noCache),
          builder: (result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            _habits.clear();
            var res = AllHabits$Query.fromJson(result.data!).allHabits;
            _habits.addAll(res!);

            return Scrollbar(
                thickness: 3,
                child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _habits.length,
                    itemBuilder: (context, i) {
                      if (i.isOdd) return const Divider();
                      final habit = _habits[i];
                      return _buildRow(habit!);
                    }));
          },
        ));
  }

  Future _refreshList() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {});
  }

  Widget _buildRow(AllHabits$Query$HabitType habit) {
    return ListTile(
      title: Text(
        habit.habitString!,
        style: _biggerFont,
      ),
      trailing: Icon(
        false ? Icons.favorite : Icons.favorite_border,
        color: false ? Colors.red : null,
      ),
      onTap: () {
        _pushEditHabit(habit.id);
      },
    );
  }

  void _pushEditHabit(String habitId) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => Backdrop(
        // Not main backdrop place
        // TODO: Make currentCategory field take _currentCategory (104)
        currentCategory: Category.all,
        // TODO: Pass _currentCategory for frontLayer (104)
        frontLayer: CreateEditHabitPage(habitId: habitId),
        // TODO: Change backLayer field value to CategoryMenuPage (104)
        backLayer: Container(color: kHabitPink100),
        frontTitle: Text('HABIT MASTER'),
        backTitle: Text('MENU'),
      ),
    ));
  }
}
