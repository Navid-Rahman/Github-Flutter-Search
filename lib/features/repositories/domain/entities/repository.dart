import 'package:equatable/equatable.dart';

class Repository extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String htmlUrl;
  final int stargazersCount;
  final int forksCount;
  final String language;
  final DateTime updatedAt;
  final DateTime createdAt;
  final Owner owner;
  final List<String> topics;

  const Repository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.forksCount,
    required this.language,
    required this.updatedAt,
    required this.createdAt,
    required this.owner,
    required this.topics,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    fullName,
    description,
    htmlUrl,
    stargazersCount,
    forksCount,
    language,
    updatedAt,
    createdAt,
    owner,
    topics,
  ];
}

class Owner extends Equatable {
  final int id;
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  const Owner({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  @override
  List<Object> get props => [id, login, avatarUrl, htmlUrl];
}
