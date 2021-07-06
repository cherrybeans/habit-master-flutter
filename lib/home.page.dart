import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
      resizeToAvoidBottomInset: false,
      // TODO: Filter habits by status chosen (category)
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Query(
      options: QueryOptions(
        document: AllHabitsQuery().document,
        fetchPolicy: FetchPolicy.networkOnly,
      ),
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

        return RefreshIndicator(
            onRefresh: () async => refetch!(),
            strokeWidth: 3,
            child: Scrollbar(
                thickness: 3,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _habits.length,
                  itemBuilder: (context, i) {
                    final habit = _habits[i];
                    return _buildRow(habit!, refetch);
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                )));
      },
    );
  }

  Widget _buildRow(AllHabits$Query$HabitType habit, Refetch? refetch) {
    return ListTile(
      title: Text(
        "After I ${habit.prompt}, I will ${habit.behavior}",
        style: _biggerFont,
      ),
      trailing: Icon(
        true ? Icons.favorite : Icons.favorite_border,
        color: true ? Colors.red : null,
      ),
      onTap: () {
        _pushEditHabit(habit, refetch);
      },
    );
  }

  void _pushEditHabit(AllHabits$Query$HabitType habit, Refetch? refetch) {
    Navigator.of(context).pushNamed(
      CreateEditHabitPage.routeNameEdit,
      arguments: CreateEditHabitScreenArguments(habit, refetch),
    );
  }
}
