import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:habit_master/graphql/habits_graphql_api.graphql.dart';

class CreateEditHabitPage extends StatefulWidget {
  final String? habitId;

  const CreateEditHabitPage({Key? key, this.habitId}) : super(key: key);

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
    _isCreateMode = widget.habitId?.isEmpty ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Mutation(
      options: MutationOptions(
        document: CreateHabitMutation(
                variables: CreateHabitArguments(
                    prompt: _promptController.text,
                    behavior: _behaviorController.text,
                    celebration: _celebrationController.text))
            .document,
        onCompleted: (data) => Navigator.pop(context, true),
      ),
      builder: (MultiSourceResult Function(Map<String, dynamic>,
                  {Object? optimisticResult})
              runMutation,
          QueryResult? result) {
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

  Widget _buildForm(Function runMutation) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 12),
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
              TextFormField(
                controller: _behaviorController,
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
              _isSaving
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isSaving = true;
                          });

                          runMutation({
                            'prompt': _promptController.text,
                            'behavior': _behaviorController.text,
                            'celebration': _celebrationController.text,
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 12,
                        ),
                        child: Text(
                          _isCreateMode ? "CREATE" : "SAVE",
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
