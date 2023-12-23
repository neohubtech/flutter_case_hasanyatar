import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/layouts/primary_layout.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_bloc/bloc/movie_bloc.dart';
import 'package:movie_app/modules/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/category_movie_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/new_release_movie_widget.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';
import 'package:movie_app/utilities/themes/app_text_theme.dart';

const List<String> movieList = [
  'https://image.tmdb.org/t/p/w220_and_h330_face/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/7WJjFviFBffEJvkAms4uWwbcVUk.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/6vcDalR50RWa309vBH1NLmG2rjQ.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/9yBVqNruk6Ykrwc32qrK2TIE5xw.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/6XYLiMxHAaCsoyrVo38LBWMw2p8.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/7D430eqZj8y3oVkLFfsWXGRcpEG.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/5NxjLfs7Bi07bfZCRl9CCnUw7AA.jpg',
  'https://image.tmdb.org/t/p/w220_and_h330_face/9dKCd55IuTT5QRs989m9Qlb7d2B.jpg',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc()..add(const GetMovieEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) => switch (state) {
          MovieError() => Center(
              child: Text('Error ${state.error}'),
            ),
          MovieLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          MovieEmpty() => const Center(
              child: Text('Empty'),
            ),
          MovieLoaded() => _Body(state: state),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.state,
  });

  final MovieLoaded state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          10.verticalSpacingRadius,
          const CategoryMovieWidget(),
          25.verticalSpacingRadius,
          if (state.bannerList.isNotEmpty) BannerWidget(state.bannerList),
          25.verticalSpacingRadius,
          if (state.combinedList.isNotEmpty)
            NewReleaseMovieWidget(state.combinedList),
        ],
      ),
    );
  }
}
