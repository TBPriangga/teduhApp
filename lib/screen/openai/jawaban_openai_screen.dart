import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/gptresponse_provider.dart';

class JawabanOpenAIScreen extends StatelessWidget {
  const JawabanOpenAIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan Consumer untuk mengakses data respons GPT-3
    return Consumer<GptResponseProvider>(
      builder: (context, gptResponseProvider, child) {
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
                  child: gptResponseProvider.gptResponse.text.isNotEmpty
                      ? Text(
                          gptResponseProvider.gptResponse.text,
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
      },
    );
  }
}
