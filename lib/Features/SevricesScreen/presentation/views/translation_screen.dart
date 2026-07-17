import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourismapp/core/constants/app_constants.dart';
import 'package:tourismapp/core/constants/app_text_styles.dart';
import '../widgets/translation/language_selector.dart';
import '../widgets/translation/translate_button.dart';
import '../widgets/translation/translation_mode_tabs.dart';
import '../widgets/translation/translation_result.dart';
import '../widgets/translation/translation_text_field.dart';
import '../widgets/translation/translator_header.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController controller = TextEditingController();
  // String translatedText = '';

  String sourceLanguageName = "English";
  String targetLanguageName = "Arabic";

  String sourceLanguage = "en";
  String targetLanguage = "ar";

  final Map<String, String> languages = {
    "English": "en",
    "Arabic": "ar",
    "German": "de",
    "French": "fr",
    "Turkish": "tr",
  };

  void showLanguageSheet({required bool isSource}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: languages.keys.map((language) {
            return ListTile(
              title: Text(language),
              onTap: () {
                setState(() {
                  if (isSource) {
                    sourceLanguageName = language;
                    sourceLanguage = languages[language]!;
                  } else {
                    targetLanguageName = language;
                    targetLanguage = languages[language]!;
                  }
                });

                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void swapLanguages() {
    setState(() {

      final tempName = sourceLanguageName;
      sourceLanguageName = targetLanguageName;
      targetLanguageName = tempName;

      final tempCode = sourceLanguage;
      sourceLanguage = targetLanguage;
      targetLanguage = tempCode;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
        ),

        title: Text("Translation", style: AppTextStyles.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const TranslatorHeader(),
                const SizedBox(height: 20),

                const TranslationTabs(),
                const SizedBox(height: 20),

                LanguageSelector(
                  sourceLanguage: sourceLanguageName,
                  targetLanguage: targetLanguageName,
                  onSourceTap: () {
                    showLanguageSheet(isSource: true);
                  },
                  onTargetTap: () {
                    showLanguageSheet(isSource: false);
                  },
                  onSwap: (){
                    swapLanguages();
                  },
                ),

                const SizedBox(height: 20),

                Text("Original text", style: AppTextStyles.title),

                const SizedBox(height: 10),

                TranslationTextField(controller: controller),

                const SizedBox(height: 25),

                Center(
                  child: TranslateButton(
                    controller: controller,
                    sourceLanguage: sourceLanguage,
                    targetLanguage: targetLanguage,
                  ),
                ),

                const SizedBox(height: 20),

                Text("Result text", style: AppTextStyles.title),

                TranslationResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
