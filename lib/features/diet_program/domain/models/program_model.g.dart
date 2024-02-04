// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDataModel _$MainDataModelFromJson(Map<String, dynamic> json) =>
    MainDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainDataModelToJson(MainDataModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      program: (json['data'] as List<dynamic>?)
          ?.map((e) => ProgramModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.program,
    };

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel(
      id: json['id'] as int?,
      programName: json['program_name'] as String?,
      dietProgramMeal: (json['diet_program_meal'] as List<dynamic>?)
          ?.map((e) => DietProgramMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_name': instance.programName,
      'diet_program_meal': instance.dietProgramMeal,
    };

DietProgramMeal _$DietProgramMealFromJson(Map<String, dynamic> json) =>
    DietProgramMeal(
      id: json['id'] as int?,
      mealName: json['meal_name'] as String?,
      dietProgramMealElement: (json['diet_program_meal_element']
              as List<dynamic>?)
          ?.map(
              (e) => DietProgramMealElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DietProgramMealToJson(DietProgramMeal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meal_name': instance.mealName,
      'diet_program_meal_element': instance.dietProgramMealElement,
    };

DietProgramMealElement _$DietProgramMealElementFromJson(
        Map<String, dynamic> json) =>
    DietProgramMealElement(
      id: json['id'] as int?,
      quantity: json['quantity'] as String?,
      foodElement: json['food_element'] == null
          ? null
          : FoodElement.fromJson(json['food_element'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DietProgramMealElementToJson(
        DietProgramMealElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'food_element': instance.foodElement,
    };

FoodElement _$FoodElementFromJson(Map<String, dynamic> json) => FoodElement(
      foodCategoryId: json['food_category_id'] as String?,
      name: json['name'] as String?,
      calories: json['calories'] as String?,
      protein: json['protein'] as String?,
      carbohydrates: json['carbohydrates'] as String?,
    )
      ..fat = json['fat'] as String?
      ..sugar = json['sugar'] as String?
      ..fiber = json['fiber'] as String?;

Map<String, dynamic> _$FoodElementToJson(FoodElement instance) =>
    <String, dynamic>{
      'food_category_id': instance.foodCategoryId,
      'name': instance.name,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbohydrates': instance.carbohydrates,
      'fat': instance.fat,
      'sugar': instance.sugar,
      'fiber': instance.fiber,
    };
