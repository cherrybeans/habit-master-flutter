import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:habit_master/graphql/habits_graphql_api.graphql.dart';

class CreateEditHabitScreenArguments {
  final AllHabits$Query$HabitType? habit;
  final Refetch? refetch;

  CreateEditHabitScreenArguments(this.habit, this.refetch);
}

class CreateEditHabitPage extends StatefulWidget {
  static const routeNameAdd = '/new-habit';
  static const routeNameEdit =
      '/edit-habit'; // how to use id in url? I'd habits/<id>/edit

  final AllHabits$Query$HabitType? habit;
  final Refetch? refetch;

  const CreateEditHabitPage({Key? key, this.habit, required this.refetch})
      : super(key: key);

  @override
  _CreateEditHabitPageState createState() => _CreateEditHabitPageState();
}

class _CreateEditHabitPageState extends State<CreateEditHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final _promptController = TextEditingController();
  final _behaviorController = TextEditingController();
  final _celebrationController = TextEditingController();

  bool _isSaving = false;
  bool _isCreateMode = true;

  @override
  void initState() {
    super.initState();
    _isCreateMode = widget.habit == null;
    if (!_isCreateMode) {
      _promptController.value = TextEditingValue(text: widget.habit!.prompt);
      _behaviorController.value =
          TextEditingValue(text: widget.habit!.behavior);
      _celebrationController.value =
          TextEditingValue(text: widget.habit!.celebration);
    }
  }

  Map<String, dynamic> expectedResult(bool isCreating) => <String, dynamic>{
        "updateHabit": {
          "habit": {
            "__typename": "HabitType",
            "id": isCreating ? "temp-id" : widget.habit!.id,
            "prompt": _promptController.text,
            "behavior": _behaviorController.text,
            "celebration": _celebrationController.text,
          }
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Mutation(
      options: MutationOptions(
          document: _isCreateMode
              ? CreateHabitMutation(
                      variables: CreateHabitArguments(
                          prompt: _promptController.text,
                          behavior: _behaviorController.text,
                          celebration: _celebrationController.text))
                  .document
              : EditHabitMutation(
                      variables: EditHabitArguments(
                          id: widget.habit!.id,
                          prompt: _promptController.text,
                          behavior: _behaviorController.text,
                          celebration: _celebrationController.text))
                  .document,
          onCompleted: (data) {
            print(data);
            widget.refetch!();
            Navigator.pop(context, true);
          }),
      builder: (RunMutation runMutation, QueryResult? result) {
        if (result!.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Text('Loading');
        }

        return _buildForm(runMutation);
      },
    ));
  }

  Widget _buildForm(RunMutation runMutation) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 12),
              Text("After I "),
              TextFormField(
                controller: _promptController,
                decoration: InputDecoration(
                  labelText: "Prompt",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a prompt';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Text(", I will "),
              TextFormField(
                controller: _behaviorController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Behavior",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a behavior';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Text(". Then I will celebrate by "),
              TextFormField(
                controller: _celebrationController,
                decoration: InputDecoration(
                  labelText: "Celebration",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a celebration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isSaving = true;
                    });
                    runMutation({
                      ..._isCreateMode ? {} : {'id': widget.habit!.id},
                      ...{
                        'prompt': _promptController.text,
                        'behavior': _behaviorController.text,
                        'celebration': _celebrationController.text,
                      },
                    }, optimisticResult: expectedResult(_isCreateMode));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  child: _isSaving
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          _isCreateMode ? "CREATE" : "SAVE",
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}
