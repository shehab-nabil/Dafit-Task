import 'package:json_annotation/json_annotation.dart';

part 'program_model.g.dart';

@JsonSerializable()
class MainDataModel {
  bool? success;
  String? message;
  Data? data;

  MainDataModel({this.success, this.message, this.data});

  factory MainDataModel.fromJson(Map<String, dynamic> json) =>
      _$MainDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(
    name: "data",
  )
  List<ProgramModel>? program;

  Data({this.program});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ProgramModel {
  int? id;
  @JsonKey(
    name: "program_name",
  )
  String? programName;
  @JsonKey(
    name: "diet_program_meal",
  )
  List<DietProgramMeal>? dietProgramMeal;

  ProgramModel({this.id, this.programName, this.dietProgramMeal});

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}

@JsonSerializable()
class DietProgramMeal {
  int? id;
  @JsonKey(
    name: "meal_name",
  )
  String? mealName;
  @JsonKey(
    name: "diet_program_meal_element",
  )
  List<DietProgramMealElement>? dietProgramMealElement;

  DietProgramMeal({this.id, this.mealName, this.dietProgramMealElement});

  factory DietProgramMeal.fromJson(Map<String, dynamic> json) =>
      _$DietProgramMealFromJson(json);

  Map<String, dynamic> toJson() => _$DietProgramMealToJson(this);
}

@JsonSerializable()
class DietProgramMealElement {
  int? id;
  String? quantity;
  @JsonKey(
    name: "food_element",
  )
  FoodElement? foodElement;

  DietProgramMealElement({this.id, this.quantity, this.foodElement});

  factory DietProgramMealElement.fromJson(Map<String, dynamic> json) =>
      _$DietProgramMealElementFromJson(json);

  Map<String, dynamic> toJson() => _$DietProgramMealElementToJson(this);
}

@JsonSerializable()
class FoodElement {
  @JsonKey(
    name: "food_category_id",
  )
  String? foodCategoryId;
  String? name;
  String? calories;
  String? protein;
  String? carbohydrates;
  String? fat;
  String? sugar;
  String? fiber;

  FoodElement({
    this.foodCategoryId,
    this.name,
    this.calories,
    this.protein,
    this.carbohydrates,
  });

  factory FoodElement.fromJson(Map<String, dynamic> json) =>
      _$FoodElementFromJson(json);

  Map<String, dynamic> toJson() => _$FoodElementToJson(this);
}
