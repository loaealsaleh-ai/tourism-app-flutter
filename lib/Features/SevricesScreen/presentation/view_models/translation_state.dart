abstract class TranslationState {}

class TranslationInitial extends TranslationState {}

class TranslationLoading extends TranslationState {}

class TranslationSuccess extends TranslationState {
  final String translatedText;

  TranslationSuccess(this.translatedText);
}

class TranslationError extends TranslationState {
  final String error;

  TranslationError(this.error);



}