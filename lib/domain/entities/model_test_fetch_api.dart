class ModelTestFetchAPI {
  final int id;
  final String code;
  final String? description;

  ModelTestFetchAPI({
    required this.id,
    required this.code,
    this.description
    });

  static ModelTestFetchAPI fromJson(json) => ModelTestFetchAPI(
      id: json['id'],
      code: json['code'],
      description: json['description']
  );
}