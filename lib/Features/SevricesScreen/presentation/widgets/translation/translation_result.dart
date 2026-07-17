import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/translation_cubit.dart';
import '../../view_models/translation_state.dart';

class TranslationResult extends StatelessWidget {
  const TranslationResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {

        if (state is TranslationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TranslationSuccess) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              state.translatedText,
            ),
          );
        }

        if (state is TranslationError) {
          return Text(
            state.error,
          );
        }

        return const SizedBox();
      },
    );
  }
}
