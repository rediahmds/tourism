import 'package:flutter/widgets.dart';
import 'package:tourism/data/api/api_services.dart';
import 'package:tourism/static/tourism_detail_result_state.dart';

class TourismDetailProvider extends ChangeNotifier {
  final APIServices _apiServices;

  TourismDetailProvider(this._apiServices);

  TourismDetailResultState _resultState = TourismDetailNoneState();

  TourismDetailResultState get resultState => _resultState;

  Future<void> fetchTourismDetail(int id) async {
    try {
      _resultState = TourismDetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getTourismDetail(id);

      if (result.error) {
        _resultState = TourismDetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismDetailLoadedState(result.place);
        notifyListeners();
      }

    } on Exception catch (e) {
      _resultState = TourismDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
