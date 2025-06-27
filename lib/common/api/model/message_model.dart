import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String id;
  final bool isUser;
  final String message;

  final DateTime? createAt;

  const Message({
    required this.isUser,
    required this.message,
    required this.createAt,
    required this.id,
  });

  static const Message emptyMessage = Message(
    id: '',
    isUser: true,
    message: '',
    createAt: null,
  );

  @override
  List<Object?> get props => [
        id,
        isUser,
        message,
        createAt,
      ];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'isUser': isUser,
        'message': message,
        'createAt': createAt,
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        isUser: json['isUser'],
        createAt: (json['createAt'] as Timestamp).toDate(),
        id: json['id'],
        message: json['message'],
      );

  Message copyWith({
    String? id,
    bool? isUser,
    String? message,
    bool? likeMessage,
    bool? dislikeMessage,
    DateTime? createAt,
  }) {
    return Message(
      id: id ?? this.id,
      isUser: isUser ?? this.isUser,
      message: message ?? this.message,
      createAt: createAt ?? this.createAt,
    );
  }
}
