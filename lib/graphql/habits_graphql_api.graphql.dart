// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'habits_graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class AllHabits$Query$HabitType extends JsonSerializable with EquatableMixin {
  AllHabits$Query$HabitType();

  factory AllHabits$Query$HabitType.fromJson(Map<String, dynamic> json) =>
      _$AllHabits$Query$HabitTypeFromJson(json);

  late String id;

  String? habitString;

  String? celebrationString;

  @JsonKey(unknownEnumValue: HabitsHabitColorChoices.artemisUnknown)
  late HabitsHabitColorChoices color;

  @JsonKey(unknownEnumValue: HabitsHabitStatusChoices.artemisUnknown)
  late HabitsHabitStatusChoices status;

  @override
  List<Object?> get props =>
      [id, habitString, celebrationString, color, status];
  @override
  Map<String, dynamic> toJson() => _$AllHabits$Query$HabitTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllHabits$Query extends JsonSerializable with EquatableMixin {
  AllHabits$Query();

  factory AllHabits$Query.fromJson(Map<String, dynamic> json) =>
      _$AllHabits$QueryFromJson(json);

  List<AllHabits$Query$HabitType?>? allHabits;

  @override
  List<Object?> get props => [allHabits];
  @override
  Map<String, dynamic> toJson() => _$AllHabits$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateHabit$Mutation$CreateHabit$HabitType extends JsonSerializable
    with EquatableMixin {
  CreateHabit$Mutation$CreateHabit$HabitType();

  factory CreateHabit$Mutation$CreateHabit$HabitType.fromJson(
          Map<String, dynamic> json) =>
      _$CreateHabit$Mutation$CreateHabit$HabitTypeFromJson(json);

  String? habitString;

  String? celebrationString;

  @override
  List<Object?> get props => [habitString, celebrationString];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateHabit$Mutation$CreateHabit$HabitTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateHabit$Mutation$CreateHabit extends JsonSerializable
    with EquatableMixin {
  CreateHabit$Mutation$CreateHabit();

  factory CreateHabit$Mutation$CreateHabit.fromJson(
          Map<String, dynamic> json) =>
      _$CreateHabit$Mutation$CreateHabitFromJson(json);

  CreateHabit$Mutation$CreateHabit$HabitType? habit;

  @override
  List<Object?> get props => [habit];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateHabit$Mutation$CreateHabitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateHabit$Mutation extends JsonSerializable with EquatableMixin {
  CreateHabit$Mutation();

  factory CreateHabit$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateHabit$MutationFromJson(json);

  CreateHabit$Mutation$CreateHabit? createHabit;

  @override
  List<Object?> get props => [createHabit];
  @override
  Map<String, dynamic> toJson() => _$CreateHabit$MutationToJson(this);
}

enum HabitsHabitColorChoices {
  @JsonValue('BLUE')
  blue,
  @JsonValue('GRAY')
  gray,
  @JsonValue('GREEN')
  green,
  @JsonValue('INDIGO')
  indigo,
  @JsonValue('LIGHTBLUE')
  lightblue,
  @JsonValue('ORANGE')
  orange,
  @JsonValue('PINK')
  pink,
  @JsonValue('RED')
  red,
  @JsonValue('VIOLET')
  violet,
  @JsonValue('YELLOW')
  yellow,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum HabitsHabitStatusChoices {
  @JsonValue('FOCUSED')
  focused,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('INTEGRATED')
  integrated,
  @JsonValue('REWORK')
  rework,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
final ALL_HABITS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'AllHabits'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'allHabits'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'habitString'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'celebrationString'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'color'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class AllHabitsQuery extends GraphQLQuery<AllHabits$Query, JsonSerializable> {
  AllHabitsQuery();

  @override
  final DocumentNode document = ALL_HABITS_QUERY_DOCUMENT;

  @override
  final String operationName = 'AllHabits';

  @override
  List<Object?> get props => [document, operationName];
  @override
  AllHabits$Query parse(Map<String, dynamic> json) =>
      AllHabits$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateHabitArguments extends JsonSerializable with EquatableMixin {
  CreateHabitArguments(
      {required this.prompt,
      required this.behavior,
      required this.celebration});

  @override
  factory CreateHabitArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateHabitArgumentsFromJson(json);

  late String prompt;

  late String behavior;

  late String celebration;

  @override
  List<Object?> get props => [prompt, behavior, celebration];
  @override
  Map<String, dynamic> toJson() => _$CreateHabitArgumentsToJson(this);
}

final CREATE_HABIT_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateHabit'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'prompt')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'behavior')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'celebration')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createHabit'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'habitData'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'prompt'),
                        value: VariableNode(name: NameNode(value: 'prompt'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'behavior'),
                        value: VariableNode(name: NameNode(value: 'behavior'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'celebration'),
                        value:
                            VariableNode(name: NameNode(value: 'celebration')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'habit'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'habitString'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'celebrationString'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class CreateHabitMutation
    extends GraphQLQuery<CreateHabit$Mutation, CreateHabitArguments> {
  CreateHabitMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_HABIT_MUTATION_DOCUMENT;

  @override
  final String operationName = 'CreateHabit';

  @override
  final CreateHabitArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateHabit$Mutation parse(Map<String, dynamic> json) =>
      CreateHabit$Mutation.fromJson(json);
}
