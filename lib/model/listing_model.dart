class Jobs {
  final int id;
  final String company;
  final String logo;
  final bool isNew;
  final bool isFeatured;
  final String position;
  final String role;
  final String level;
  final String postedAt;
  final String contract;
  final String location;
  final List<String> languages;
  final List<String> tools;

  Jobs({
    required this.id,
    required this.company,
    required this.logo,
    required this.isNew,
    required this.isFeatured,
    required this.position,
    required this.role,
    required this.level,
    required this.postedAt,
    required this.contract,
    required this.location,
    required this.languages,
    required this.tools,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      id: json['id'],
      company: json['company'],
      logo: json['logo'],
      isNew: json['new'],
      isFeatured: json['featured'],
      position: json['position'],
      role: json['role'],
      level: json['level'],
      postedAt: json['postedAt'],
      contract: json['contract'],
      location: json['location'],
      languages: List<String>.from(json['languages']),
      tools: List<String>.from(json['tools']),
    );
  }
}
