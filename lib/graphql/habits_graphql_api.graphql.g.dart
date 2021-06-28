// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'habits_graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllHabits$Query$HabitType _$AllHabits$Query$HabitTypeFromJson(
    Map<String, dynamic> json) {
  return AllHabits$Query$HabitType()
    ..id = json['id'] as String
    ..habitString = json['habitString'] as String?
    ..celebrationString = json['celebrationString'] as String?
    ..color = _$enumDecode(_$HabitsHabitColorChoicesEnumMap, json['color'],
        unknownValue: HabitsHabitColorChoices.artemisUnknown)
    ..status = _$enumDecode(_$HabitsHabitStatusChoicesEnumMap, json['status'],
        unknownValue: HabitsHabitStatusChoices.artemisUnknown);
}

Map<String, dynamic> _$AllHabits$Query$HabitTypeToJson(
        AllHabits$Query$HabitType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitString': instance.habitString,
      'celebrationString': instance.celebrationString,
      'color': _$HabitsHabitColorChoicesEnumMap[instance.color],
      'status': _$HabitsHabitStatusChoicesEnumMap[instance.status],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$HabitsHabitColorChoicesEnumMap = {
  HabitsHabitColorChoices.blue: 'BLUE',
  HabitsHabitColorChoices.gray: 'GRAY',
  HabitsHabitColorChoices.green: 'GREEN',
  HabitsHabitColorChoices.indigo: 'INDIGO',
  HabitsHabitColorChoices.lightblue: 'LIGHTBLUE',
  HabitsHabitColorChoices.orange: 'ORANGE',
  HabitsHabitColorChoices.pink: 'PINK',
  HabitsHabitColorChoices.red: 'RED',
  HabitsHabitColorChoices.violet: 'VIOLET',
  HabitsHabitColorChoices.yellow: 'YELLOW',
  HabitsHabitColorChoices.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$HabitsHabitStatusChoicesEnumMap = {
  HabitsHabitStatusChoices.focused: 'FOCUSED',
  HabitsHabitStatusChoices.inactive: 'INACTIVE',
  HabitsHabitStatusChoices.integrated: 'INTEGRATED',
  HabitsHabitStatusChoices.rework: 'REWORK',
  HabitsHabitStatusChoices.artemisUnknown: 'ARTEMIS_UNKNOWN',
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
    ..habitString = json['habitString'] as String?
    ..celebrationString = json['celebrationString'] as String?;
}

Map<String, dynamic> _$CreateHabit$Mutation$CreateHabit$HabitTypeToJson(
        CreateHabit$Mutation$CreateHabit$HabitType instance) =>
    <String, dynamic>{
      'habitString': instance.habitString,
      'celebrationString': instance.celebrationString,
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
