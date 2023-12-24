import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/home/presentation/blocs/bottom_navigation_cubit/bottom_navigation_cubit.dart';

void main() {
  group('BottomNavigationCubit', () {
    blocTest<BottomNavigationCubit, int>(
      'emits [index] when onBottomNavigationItemTap is called',
      build: BottomNavigationCubit.new,
      act: (cubit) => cubit.onBottomNavigationItemTap(1),
      expect: () => [1],
    );

    blocTest<BottomNavigationCubit, int>(
      'emits [index] when onBottomNavigationItemTap is called multiple times',
      build: BottomNavigationCubit.new,
      act: (cubit) {
        cubit
          ..onBottomNavigationItemTap(1)
          ..onBottomNavigationItemTap(2)
          ..onBottomNavigationItemTap(3);
      },
      expect: () => [1, 2, 3],
    );
  });
}
