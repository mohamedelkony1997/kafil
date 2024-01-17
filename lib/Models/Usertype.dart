
class ApiResponse {
  final int status;
  final bool success;
  final ApiData data;

  ApiResponse({required this.status, required this.success, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      success: json['success'],
      data: ApiData.fromJson(json['data']),
    );
  }
}

class ApiData {
  final List<ApiType> types;
  final List<ApiTag> tags;
  final List<ApiSocialMedia> socialMedia;

  ApiData({required this.types, required this.tags, required this.socialMedia});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      types: (json['types'] as List).map((type) => ApiType.fromJson(type)).toList(),
      tags: (json['tags'] as List).map((tag) => ApiTag.fromJson(tag)).toList(),
      socialMedia: (json['social_media'] as List)
          .map((media) => ApiSocialMedia.fromJson(media))
          .toList(),
    );
  }
}

class ApiType {
  final int value;
  final String label;

  ApiType({required this.value, required this.label});

  factory ApiType.fromJson(Map<String, dynamic> json) {
    return ApiType(
      value: json['value'],
      label: json['label'],
    );
  }
}

class ApiTag {
  final int value;
  final String label;

  ApiTag({required this.value, required this.label});

  factory ApiTag.fromJson(Map<String, dynamic> json) {
    return ApiTag(
      value: json['value'],
      label: json['label'],
    );
  }
}

class ApiSocialMedia {
  final String value;
  final String label;

  ApiSocialMedia({required this.value, required this.label});

  factory ApiSocialMedia.fromJson(Map<String, dynamic> json) {
    return ApiSocialMedia(
      value: json['value'],
      label: json['label'],
    );
  }
}
