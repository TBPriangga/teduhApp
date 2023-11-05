// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/gptresponse_model.dart';
import '../../provider/gptresponse_provider.dart';
import '../../utils/openai_service.dart';
import 'jawaban_openai_screen.dart';

class HomeOpenAiScreen extends StatefulWidget {
  const HomeOpenAiScreen({Key? key}) : super(key: key);
  static const routeName = '/HomeOpenAiScreen';

  @override
  State<HomeOpenAiScreen> createState() => _HomeOpenAiScreenState();
}

class _HomeOpenAiScreenState extends State<HomeOpenAiScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _promptcontroller = TextEditingController();

  bool isLoading = false;

  void _getRecommendation() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        final result = await RecommendationService.getRecommendation(
          prompt: _promptcontroller.value.text,
        );

        if (mounted) {
          setState(() {
            isLoading = false;
          });

          // Update GptResponseModel using Provider
          final gptResponseProvider =
              Provider.of<GptResponseProvider>(context, listen: false);
          gptResponseProvider
              .setGptResponse(GptResponseModel(result.choices[0].text));

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const JawabanOpenAIScreen();
            },
          ));
        }
      } catch (e) {
        const snackBar = SnackBar(
          content: Text('Failed to send a request. Please try again.'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              heightFactor: 4,
              child: Text(
                'Penjelasan dari AI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Tanyakan ke AI"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _promptcontroller,
                decoration: const InputDecoration(
                  hintText: 'Tambahkan pertanyaan anda disini',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan pertanyaan';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: _getRecommendation,
                      child: const Center(
                        child: Text('Dapatkan Jawaban'),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                    ),
            )
          ],
        ),
      )),
    );
  }
}
