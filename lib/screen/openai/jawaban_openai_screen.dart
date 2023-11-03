import 'package:flutter/material.dart';

import '../../model/openai_model.dart';

class JawabanOpenAIScreen extends StatelessWidget {
  const JawabanOpenAIScreen({Key? key, required this.gptResponseData})
      : super(key: key);

  final GptData gptResponseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Jawaban',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: gptResponseData.choices.isNotEmpty
                  ? Text(
                      gptResponseData.choices[0].text,
                      textAlign: TextAlign.justify,
                    )
                  : const Text(
                      'No recommendations available',
                      textAlign: TextAlign.justify,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
