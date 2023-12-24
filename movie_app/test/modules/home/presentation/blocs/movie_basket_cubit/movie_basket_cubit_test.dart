import 'package:bloc_test/bloc_test.dart';
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

  group(
    'MovieBasketCubit',
    () {
      blocTest<MovieBasketCubit, MovieBasketState>(
        'emits [MovieBasketState] when onMovieTap is called',
        build: MovieBasketCubit.new,
        act: (cubit) => cubit.onMovieTap(combinedList[1]),
        expect: () => [
          const MovieBasketState(
            combinedList: [
              CombinedList(
                name: 'Movie 2',
                type: 'Type 2',
                explanation: 'This is explanation 2',
                imageUrl:
                    'https://image.tmdb.org/t/p/w220_and_h330_face/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
              ),
            ],
          ),
        ],
      );

      blocTest<MovieBasketCubit, MovieBasketState>(
        'emits [MovieBasketState] when onMovieTap is called multiple times',
        build: MovieBasketCubit.new,
        act: (cubit) => cubit
          ..onMovieTap(combinedList[0])
          ..onMovieTap(combinedList[1])
          ..onMovieTap(combinedList[2])
          ..onMovieTap(combinedList[2])
          ..onMovieTap(combinedList[0]),
        expect: () => [
          MovieBasketState(
            combinedList: [combinedList[0]],
          ),
          MovieBasketState(
            combinedList: [combinedList[0], combinedList[1]],
          ),
          MovieBasketState(
            combinedList: [combinedList[0], combinedList[1], combinedList[2]],
          ),
          MovieBasketState(
            combinedList: [combinedList[0], combinedList[1]],
          ),
          MovieBasketState(
            combinedList: [combinedList[1]],
          ),
        ],
      );
    },
  );
}
