import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/home/data/models/banner_list/banner_list_model.dart';
import 'package:movie_app/modules/home/presentation/widgets/movie_section_title_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/neumorphic_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget(
    this.bannerList, {
    super.key,
  });
  final List<BannerList> bannerList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MovieSectionTitleWidget(
          title: 'En Popüler',
          trailingText: 'Listem',
        ),
        SizedBox(
          height: 160.h,
          child: ListView.builder(
            itemCount: bannerList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 6).r,
            itemBuilder: (context, index) {
              return _CardWidget(
                imageUrl: bannerList[index].imageUrl,
                title: bannerList[index].name,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    this.imageUrl,
    this.title,
  });

  final String? imageUrl;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: imageUrl != null,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailScreen(imageUrl, isActiveHero: true),
          //   ),
          // );
        },
        child: Container(
          width: 120.w,
          height: 120.h,
          margin: const EdgeInsets.all(8).r,
          child: Column(
            children: [
              Hero(
                tag: imageUrl ?? '',
                child: AspectRatio(
                  aspectRatio: 1,
                  child: NeumorphicWidget(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10).r,
                      child: Image.network(
                        imageUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              6.verticalSpacingRadius,
              if (title != null)
                Text(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
