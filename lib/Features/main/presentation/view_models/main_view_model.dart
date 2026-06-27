import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewModel extends Cubit<int> {
  MainViewModel() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}
