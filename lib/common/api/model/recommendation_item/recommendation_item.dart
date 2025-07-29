import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recommendation_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RecommendationItem extends Equatable {
  final String id;
  final String title;
  final String? description;
  final String imageUrl;
  final String? subtitle;
  final List<String> recommendationItems;

  const RecommendationItem({
    required this.id,
    required this.title,
    this.description,
    required this.imageUrl,
    this.subtitle,
    required this.recommendationItems
  });

  Map<String, dynamic> toJson() => _$RecommendationItemToJson(this);

  factory RecommendationItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendationItemFromJson(json);

factory RecommendationItem.empty() => RecommendationItem(title: '', imageUrl: '', id: '', description: '', subtitle: '', recommendationItems: []);

  @override
  List<Object?> get props => [id, title, description, imageUrl, subtitle, recommendationItems];
}
