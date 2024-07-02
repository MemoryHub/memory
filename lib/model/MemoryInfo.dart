class MemoryInfo {
  final String url;
  final String title;
  final String author;

  MemoryInfo(this.url, this.title, this.author);

  factory MemoryInfo.fromJson(Map<String, dynamic> json) {
    return MemoryInfo(
      json['url'] as String,
      json['title'] as String,
      json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
      'author': author,
    };
  }

  @override
  String toString() {
    return 'MemoryInfo{url: $url, title: $title, author: $author}';
  }
  
}