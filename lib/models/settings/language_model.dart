
class LanguageModel {
  final int id;
  final String language;

  LanguageModel({required this.id, required this.language});

  static List<LanguageModel> languages = [
    LanguageModel(id: 2, language: "ar"),
    LanguageModel(id: 3, language: "en"),
    LanguageModel(id: 4, language: "de"),
    LanguageModel(id: 5, language: "tr"),
    LanguageModel(id: 48, language: "fr"),
    LanguageModel(id: 49, language: "it"),
  ];


}