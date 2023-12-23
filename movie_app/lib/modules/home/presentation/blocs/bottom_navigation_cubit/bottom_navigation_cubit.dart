import 'package:bloc/bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void onBottomNavigationItemTap(int index) {
    emit(index);
  }
}
