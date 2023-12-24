import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_bloc/bloc/movie_bloc.dart';

void main() {
  group('MovieEvent Test -->', () {
    test('GetMovieEvent should be extend MovieEvent', () {
      expect(
        const GetMovieEvent(),
        isA<MovieEvent>(),
      );
    });
  });
}
