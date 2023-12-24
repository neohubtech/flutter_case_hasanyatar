import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_basket_cubit/movie_basket_cubit.dart';

void main() {
  const combinedList = [
    CombinedList(
      name: 'Movie 1',
      type: 'Type 1',
      explanation: 'This is explanation 1',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg',
    ),
    CombinedList(
      name: 'Movie 2',
      type: 'Type 2',
      explanation: 'This is explanation 2',
      imageUrl:
          'https://image.tmdb.org/t/p/w220_and_h330_face/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
    ),
    CombinedList(
      name: 'Movie 3',
      type: 'Type 3',
      explanation: 'This is explanation 3',
      imageUrl:
          'https://image.tmdb.org/t/p/w220_and_h330_face/1WZbbPApEivA421gCOluuzMMKCk.jpg',
    ),
  ];

  group('MovieBasketState', () {
    test('shouldContainMovie returns true if movie is in the list', () {
      // Arrange
      final movie1 = combinedList[0];
      final movie2 = combinedList[1];
      final state = MovieBasketState(combinedList: [movie1, movie2]);

      // Act
      final result1 = state.shouldContainMovie(movie1);
      final result2 = state.shouldContainMovie(movie2);
      final result3 = state.shouldContainMovie(combinedList[2]);

      // Assert
      expect(result1, true);
      expect(result2, true);
      expect(result3, false);
    });

    test('movieCount returns correct count', () {
      // Arrange
      final movie1 = combinedList[0];
      final movie2 = combinedList[1];
      final state = MovieBasketState(combinedList: [movie1, movie2]);

      // Act
      final result = state.movieCount;

      // Assert
      expect(result, 2);
    });
  });
}
