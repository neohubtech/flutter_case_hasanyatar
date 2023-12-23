part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieEmpty extends MovieState {}

final class MovieLoaded extends MovieState {
  const MovieLoaded({required this.moviesModel});
  final MoviesModel moviesModel;

  List<BannerList> get bannerList => moviesModel.bannerList ?? [];
  List<CombinedList> get combinedList => moviesModel.combinedList ?? [];

  @override
  List<Object?> get props => [moviesModel, bannerList, combinedList];
}

final class MovieError extends MovieState {
  const MovieError(this.errorResponse);
  final ErrorResponse errorResponse;

  ErrorResponse<DioException> get error =>
      errorResponse as ErrorResponse<DioException>;

  @override
  List<Object> get props => [errorResponse];
}
