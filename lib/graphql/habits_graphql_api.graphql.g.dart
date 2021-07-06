// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'habits_graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllHabits$Query$HabitType _$AllHabits$Query$HabitTypeFromJson(
    Map<String, dynamic> json) {
  return AllHabits$Query$HabitType()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..prompt = json['prompt'] as String
    ..behavior = json['behavior'] as String
    ..celebration = json['celebration'] as String;
}

Map<String, dynamic> _$AllHabits$Query$HabitTypeToJson(
        AllHabits$Query$HabitType instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'prompt': instance.prompt,
      'behavior': instance.behavior,
      'celebration': instance.celebration,
    };

AllHabits$Query _$AllHabits$QueryFromJson(Map<String, dynamic> json) {
  return AllHabits$Query()
    ..allHabits = (json['allHabits'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AllHabits$Query$HabitType.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$AllHabits$QueryToJson(AllHabits$Query instance) =>
    <String, dynamic>{
      'allHabits': instance.allHabits?.map((e) => e?.toJson()).toList(),
    };

CreateHabit$Mutation$CreateHabit$HabitType
    _$CreateHabit$Mutation$CreateHabit$HabitTypeFromJson(
        Map<String, dynamic> json) {
  return CreateHabit$Mutation$CreateHabit$HabitType()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..prompt = json['prompt'] as String
    ..behavior = json['behavior'] as String
    ..celebration = json['celebration'] as String;
}

Map<String, dynamic> _$CreateHabit$Mutation$CreateHabit$HabitTypeToJson(
        CreateHabit$Mutation$CreateHabit$HabitType instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'prompt': instance.prompt,
      'behavior': instance.behavior,
      'celebration': instance.celebration,
    };

CreateHabit$Mutation$CreateHabit _$CreateHabit$Mutation$CreateHabitFromJson(
    Map<String, dynamic> json) {
  return CreateHabit$Mutation$CreateHabit()
    ..habit = json['habit'] == null
        ? null
        : CreateHabit$Mutation$CreateHabit$HabitType.fromJson(
            json['habit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateHabit$Mutation$CreateHabitToJson(
        CreateHabit$Mutation$CreateHabit instance) =>
    <String, dynamic>{
      'habit': instance.habit?.toJson(),
    };

CreateHabit$Mutation _$CreateHabit$MutationFromJson(Map<String, dynamic> json) {
  return CreateHabit$Mutation()
    ..createHabit = json['createHabit'] == null
        ? null
        : CreateHabit$Mutation$CreateHabit.fromJson(
            json['createHabit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateHabit$MutationToJson(
        CreateHabit$Mutation instance) =>
    <String, dynamic>{
      'createHabit': instance.createHabit?.toJson(),
    };

EditHabit$Mutation$UpdateHabit$HabitType
    _$EditHabit$Mutation$UpdateHabit$HabitTypeFromJson(
        Map<String, dynamic> json) {
  return EditHabit$Mutation$UpdateHabit$HabitType()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..prompt = json['prompt'] as String
    ..behavior = json['behavior'] as String
    ..celebration = json['celebration'] as String;
}

Map<String, dynamic> _$EditHabit$Mutation$UpdateHabit$HabitTypeToJson(
        EditHabit$Mutation$UpdateHabit$HabitType instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'prompt': instance.prompt,
      'behavior': instance.behavior,
      'celebration': instance.celebration,
    };

EditHabit$Mutation$UpdateHabit _$EditHabit$Mutation$UpdateHabitFromJson(
    Map<String, dynamic> json) {
  return EditHabit$Mutation$UpdateHabit()
    ..habit = json['habit'] == null
        ? null
        : EditHabit$Mutation$UpdateHabit$HabitType.fromJson(
            json['habit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EditHabit$Mutation$UpdateHabitToJson(
        EditHabit$Mutation$UpdateHabit instance) =>
    <String, dynamic>{
      'habit': instance.habit?.toJson(),
    };

EditHabit$Mutation _$EditHabit$MutationFromJson(Map<String, dynamic> json) {
  return EditHabit$Mutation()
    ..updateHabit = json['updateHabit'] == null
        ? null
        : EditHabit$Mutation$UpdateHabit.fromJson(
            json['updateHabit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EditHabit$MutationToJson(EditHabit$Mutation instance) =>
    <String, dynamic>{
      'updateHabit': instance.updateHabit?.toJson(),
    };

CreateHabitArguments _$CreateHabitArgumentsFromJson(Map<String, dynamic> json) {
  return CreateHabitArguments(
    prompt: json['prompt'] as String,
    behavior: json['behavior'] as String,
    celebration: json['celebration'] as String,
  );
}

Map<String, dynamic> _$CreateHabitArgumentsToJson(
        CreateHabitArguments instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'behavior': instance.behavior,
      'celebration': instance.celebration,
    };

EditHabitArguments _$EditHabitArgumentsFromJson(Map<String, dynamic> json) {
  return EditHabitArguments(
    id: json['id'] as String,
    prompt: json['prompt'] as String,
    behavior: json['behavior'] as String,
    celebration: json['celebration'] as String,
  );
}

Map<String, dynamic> _$EditHabitArgumentsToJson(EditHabitArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'behavior': instance.behavior,
      'celebration': instance.celebration,
    };
