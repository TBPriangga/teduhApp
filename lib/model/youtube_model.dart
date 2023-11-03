// To parse this JSON data, do
//
//     final channelInfo = channelInfoFromJson(jsonString);

import 'dart:convert';

ChannelInfo channelInfoFromJson(String str) =>
    ChannelInfo.fromJson(json.decode(str));

String channelInfoToJson(ChannelInfo data) => json.encode(data.toJson());

class ChannelInfo {
  String kind;
  String etag;
  PageInfo pageInfo;
  List<Item> items;

  ChannelInfo({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

  factory ChannelInfo.fromJson(Map<String, dynamic> json) => ChannelInfo(
        kind: json["kind"],
        etag: json["etag"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "pageInfo": pageInfo.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;
  Statistics statistics;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.statistics,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
        "statistics": statistics.toJson(),
      };
}

class ContentDetails {
  RelatedPlaylists relatedPlaylists;

  ContentDetails({
    required this.relatedPlaylists,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        relatedPlaylists: RelatedPlaylists.fromJson(json["relatedPlaylists"]),
      );

  Map<String, dynamic> toJson() => {
        "relatedPlaylists": relatedPlaylists.toJson(),
      };
}

class RelatedPlaylists {
  String likes;
  String uploads;

  RelatedPlaylists({
    required this.likes,
    required this.uploads,
  });

  factory RelatedPlaylists.fromJson(Map<String, dynamic> json) =>
      RelatedPlaylists(
        likes: json["likes"],
        uploads: json["uploads"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "uploads": uploads,
      };
}

class Snippet {
  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;

  Snippet({
    required this.title,
    required this.description,
    required this.customUrl,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnails": thumbnails.toJson(),
        "localized": localized.toJson(),
        "country": country,
      };
}

class Localized {
  String title;
  String description;

  Localized({
    required this.title,
    required this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
      };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Statistics {
  String viewCount;
  String subscriberCount;
  bool hiddenSubscriberCount;
  String videoCount;

  Statistics({
    required this.viewCount,
    required this.subscriberCount,
    required this.hiddenSubscriberCount,
    required this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        subscriberCount: json["subscriberCount"],
        hiddenSubscriberCount: json["hiddenSubscriberCount"],
        videoCount: json["videoCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "subscriberCount": subscriberCount,
        "hiddenSubscriberCount": hiddenSubscriberCount,
        "videoCount": videoCount,
      };
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
