import '../../domain/entities/repository.dart';

class RepositoryModel extends Repository {
  const RepositoryModel({
    required super.id,
    required super.name,
    required super.fullName,
    required super.description,
    required super.htmlUrl,
    required super.stargazersCount,
    required super.forksCount,
    required super.language,
    required super.updatedAt,
    required super.createdAt,
    required super.owner,
    required super.topics,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      description: json['description'] ?? '',
      htmlUrl: json['html_url'],
      stargazersCount: json['stargazers_count'],
      forksCount: json['forks_count'],
      language: json['language'] ?? '',
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      owner: OwnerModel.fromJson(json['owner']),
      topics: List<String>.from(json['topics'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'html_url': htmlUrl,
      'stargazers_count': stargazersCount,
      'forks_count': forksCount,
      'language': language,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'owner': (owner as OwnerModel).toJson(),
      'topics': topics,
    };
  }
}

class OwnerModel extends Owner {
  const OwnerModel({
    required super.id,
    required super.login,
    required super.avatarUrl,
    required super.htmlUrl,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
    };
  }
}
