import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismapp/Features/SevricesScreen/presentation/view_models/translation_state.dart';

import '../../data/services/translation_service.dart';

class TranslationCubit extends Cubit<TranslationState> {
  final TranslationService service;

  TranslationCubit(this.service) : super(TranslationInitial());

  Future<void> translate({
    required String text,
    required String from,
    required String to,
  }) async {
    emit(TranslationLoading());

    try {
      final result = await service.translate(text, from, to);

      emit(TranslationSuccess(result));
    } catch (e) {
      emit(TranslationError(e.toString()));
    }
  }
}
