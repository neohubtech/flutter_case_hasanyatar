part of 'movie_basket_cubit.dart';

class MovieBasketState extends Equatable {
  const MovieBasketState({
    required this.combinedList,
  });

  final List<CombinedList> combinedList;

  int get movieCount => combinedList.length;

  bool shouldContainMovie(CombinedList data) => combinedList.contains(data);

  @override
  List<Object> get props => [combinedList, movieCount];

  @override
  bool get stringify => true;
}
