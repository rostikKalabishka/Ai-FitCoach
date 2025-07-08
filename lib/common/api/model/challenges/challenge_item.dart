import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ChallengeItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;
  final String? description;

  const ChallengeItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  ChallengeItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    double? price,
    String? imageUrl,
    String? description,
  }) {
    return ChallengeItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: imageUrl ?? this.description,
    );
  }

  factory ChallengeItem.fromJson(Map<String, dynamic> json) =>
      _$ChallengeItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeItemToJson(this);

  @override
  List<Object?> get props => [id, title, subtitle, price, imageUrl, description];
}

