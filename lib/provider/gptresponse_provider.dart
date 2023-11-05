import 'package:flutter/material.dart';

import '../model/gptresponse_model.dart';

class GptResponseProvider with ChangeNotifier {
  GptResponseModel _gptResponse = GptResponseModel('');

  GptResponseModel get gptResponse => _gptResponse;

  void setGptResponse(GptResponseModel response) {
    _gptResponse = response;
    notifyListeners();
  }
}
