class CountryDropDownModel {
  String? name;
  String? code;

  CountryDropDownModel({this.name, this.code});

  factory CountryDropDownModel.fromJson(Map<String, dynamic> json) {
    return CountryDropDownModel(
      name: json['name'] as String?,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}
