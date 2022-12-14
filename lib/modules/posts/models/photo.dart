import 'package:json_annotation/json_annotation.dart';
import 'package:social_instagram/modules/posts/models/picture.dart';

import '../../../models/user.dart';

// class Photo {
//   String? id;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   String? title;
//   String? description;
//   Picture? image;
//   int? commentCounts;
//   int? likeCounts;
//   int? viewCounts;
//   int? collectionCounts;
//   int? pulseScore;
//   String? pulseType;
//   bool? isPrivate;
//   bool? isSensitive;
//   int? storageLength;
//   User? user;
//   bool? liked;
//
//   String get url => image?.url ?? '';
//
//   Photo(
//       {this.id,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.title,
//       this.description,
//       this.image,
//       this.commentCounts,
//       this.likeCounts,
//       this.viewCounts,
//       this.collectionCounts,
//       this.pulseScore,
//       this.pulseType,
//       this.isPrivate,
//       this.isSensitive,
//       this.storageLength,
//       this.user,
//       this.liked});
//
//   Photo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     title = json['title'];
//     description = json['description'];
//     image = json['image'] != null ? new Picture.fromJson(json['image']) : null;
//     commentCounts = json['comment_counts'];
//     likeCounts = json['like_counts'];
//     viewCounts = json['view_counts'];
//     collectionCounts = json['collection_counts'];
//     pulseScore = json['pulse_score'];
//     pulseType = json['pulse_type'];
//     isPrivate = json['is_private'];
//     isSensitive = json['is_sensitive'];
//     storageLength = json['storage_length'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     liked = json['liked'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     data['comment_counts'] = this.commentCounts;
//     data['like_counts'] = this.likeCounts;
//     data['view_counts'] = this.viewCounts;
//     data['collection_counts'] = this.collectionCounts;
//     data['pulse_score'] = this.pulseScore;
//     data['pulse_type'] = this.pulseType;
//     data['is_private'] = this.isPrivate;
//     data['is_sensitive'] = this.isSensitive;
//     data['storage_length'] = this.storageLength;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     data['liked'] = this.liked;
//     return data;
//   }
// }

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;

  @JsonKey(name: 'image', includeIfNull: false)
  final Picture? image;

  @JsonKey(name: 'comment_counts', includeIfNull: false)
  final int? commentCounts;

  @JsonKey(name: 'like_counts', includeIfNull: false)
  int? likeCounts;

  @JsonKey(name: 'collection_counts', includeIfNull: false)
  final int? collectionCounts;

  @JsonKey(name: 'view_counts', includeIfNull: false)
  final int? viewCounts;

  @JsonKey(name: 'is_private', includeIfNull: false)
  final bool? isPrivate;

  @JsonKey(name: 'is_sensitive', includeIfNull: false)
  final bool? isSensitive;

  @JsonKey(name: 'storage_length', includeIfNull: false)
  final int? storageLength;

  @JsonKey(name: 'user', includeIfNull: false)
  final User? user;

  @JsonKey(name: 'liked', includeIfNull: false)
  bool? liked;

  String get url => image?.url ?? '';

  // String get timeAgo => StringUtils.calcTimePost(createdAt);

  Photo({
    this.id,
    this.createdAt,
    this.title,
    this.description,
    this.image,
    this.commentCounts,
    this.likeCounts,
    this.collectionCounts,
    this.viewCounts,
    this.isPrivate,
    this.isSensitive,
    this.storageLength,
    this.user,
    this.liked,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
