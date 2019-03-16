class DailyResponse {
  List<dynamic> category;
  bool error;
  Map<String, dynamic> results;

  DailyResponse(this.category, this.error, this.results);

  DailyResponse.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        category = json['category'],
        results = json['results'];
}

class CategoryResponse {
  bool error;
  List<dynamic> results;
  CategoryResponse(this.error, this.results);

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    this.error = json['error'];
    this.results = json['results'];
  }

  Map<String, dynamic> toJson() => {'error': error, 'results': results};
}

class PostData {
  String _id;
  String createdAt;
  String desc;
  List<dynamic> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;
  bool isTitle = false;
  String category;

  // 构造方法
  PostData(this._id, this.createdAt, this.desc, this.images, this.publishedAt,
      this.source, this.type, this.url, this.used, this.who);

  // 构造方法
  PostData.title(this.isTitle, this.category);
  // void title(bool isTitle , String category) {
  //   this.isTitle =isTitle;
  //   this.category =category;
  // }

  // 构造方法
  PostData.addField(Map<String, dynamic> json, {String category}) {
    this.category = category;
    setField(json);
  }

  void setField(Map<String, dynamic> json) {
    this.createdAt = json['createdAt'];
    this.desc = json['desc'] ?? '';
    this.images =
        json['images']?.map<String>((image) => image as String)?.toList() ?? [];
    this.publishedAt = json['publishedAt'];
    this.source = json['source'];
    this.type = json['type'];
    this.url = json['url'];
    this.who = json['who'] ?? 'github';
  }

  // 构造方法
  PostData.fromJson(Map<String, dynamic> json) {
    this._id = json['_id'];
    this.createdAt = json['createdAt'];
    this.desc = json['desc'];
    this.images = json['images'];
    this.publishedAt = json['publishedAt'];
    this.source = json['source'];
    this.type = json['type'];
    this.url = json['url'];
    this.used = json['used'];
    this.who = json['who'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'createdAt': createdAt,
      'desc': desc,
      'images': images,
      'publishedAt': publishedAt,
      'source': source,
      'type': type,
      'url': url,
      'used': used,
      'who': who,
      'category': category,
    };
  }
}

class SearchResponse {
  int count;
  bool error;
  List<dynamic> results;
  SearchResponse(this.count, this.error, this.results);

  SearchResponse.fromJson(Map<String, dynamic> json) {
    this.count = json['count'];
    this.error = json['error'];
    this.results = json['results'];
  }
}

class SearchData {
  String ganhuo_id;
  String desc;
  String publishedAt;
  String readability;
  String type;
  String url;
  String who;

  SearchData(this.ganhuo_id, this.desc, this.publishedAt, this.readability,
      this.type, this.url, this.who);

  SearchData.fromJson(Map<String, dynamic> json) {
    ganhuo_id = json['ganhuo_id'];
    desc = json['desc'];
    publishedAt = json['publishedAt'];
    readability = json['readability'];
    type = json['type'];
    url = json['url'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() => {
        'ganhuo_id': ganhuo_id,
        'desc': desc,
        'publishedAt': publishedAt,
        'readability': readability,
        'type': type,
        'url': url,
        'who': who,
      };
}

class GankPost {
  List<String> category;
  Map itemDataMap = Map();
  String girlImage;
  List<PostData> gankItems = [];

  GankPost.fromJson(Map<String, dynamic> json)
      : category = json['category']?.map<String>((c) => c.toString())?.toList(),
        girlImage = json['results']['福利'][0]['url'] {
    var results = json['results'];
    results.forEach((name, value) {
      if (name != '福利') {
        print('====GankPost fromJson===');
        print(name);
        itemDataMap[name] = _createGankItemListFromJson(name, value);
      }
    });
  }

  List<PostData> _createGankItemListFromJson(String name, List value) {
    var gankItemList = value
        .map<PostData>((item) => PostData.addField(item, category: name))
        .toList();

    gankItems.add(PostData.title(true, name));
    gankItems.addAll(gankItemList);
    return gankItemList;
  }
}
