import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_bloc/bloc/movie_bloc.dart';
import 'package:movie_app/modules/home/presentation/widgets/banner_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/category_movie_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/new_release_movie_widget.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc()..add(const GetMovieEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) => switch (state) {
          MovieError() => Center(
              child: Text(context.localizations.system_error_occurred),
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
