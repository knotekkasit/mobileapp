import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodPageAppBar extends StatelessWidget {
  const FoodPageAppBar({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'lib/images/ข้าวหน้าแซลมอน.jpg',
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'lib/images/back.svg',
            height: 18,
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'lib/images/share.svg',
            height: 23,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'lib/images/search.svg',
              height: 27,
            ),
          ),
        )
      ],
    );
  }
}
