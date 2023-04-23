import 'package:flutter/material.dart';
import 'package:modernlogintute/components/food_categories.dart';
import 'package:modernlogintute/components/menu.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import '../components/food_appbar.dart';
import '../components/food_info.dart';
import '../components/menu_card.dart';

class FoodPage extends StatefulWidget {
  FoodPage({key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final scrollController = ScrollController();

  int selectedCategoryIndex = 0;

  double foodInfoHeight = 200 + 170 - kToolbarHeight;

  @override
  void initState() {
    createBreackPoints();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }

      scrollController.animateTo(
        foodInfoHeight + (116 * totalItems) + (50 * index),
        duration: Duration(microseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  List<double> breackPonts = [];
  void createBreackPoints() {
    double firstBreackPoint =
        foodInfoHeight + 50 + (116 * demoCategoryMenus[0].items.length);

    breackPonts.add(firstBreackPoint);

    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breackPoint =
          breackPonts.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breackPonts.add(breackPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breackPonts.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breackPonts[i - 1] <= offset) & (offset < breackPonts[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
      slivers: [
        FoodPageAppBar(),
        SliverToBoxAdapter(
          child: FoodInfo(),
        ),
        SliverPersistentHeader(
          delegate: FoodCategories(
            onChanged: scrollToCategory,
            selectedIndex: selectedCategoryIndex,
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(delegate: SliverChildBuilderDelegate(
            (context, categoryIndex) {
              List<Menu> items = demoCategoryMenus[categoryIndex].items;
              return MenuCategoryItem(
                title: demoCategoryMenus[categoryIndex].category,
                items: List.generate(
                  items.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MenuCard(
                      title: items[index].title,
                      image: items[index].image,
                      price: items[index].price,
                    ),
                  ),
                ),
              );
            },
          )),
        ),
      ],
    ));
  }
}
