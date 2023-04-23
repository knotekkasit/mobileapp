// For demo

class Menu {
  final String title, image;
  final double price;

  Menu({this.title, this.image, this.price});
}

class CategoryMenu {
  final String category;
  final List<Menu> items;

  CategoryMenu({this.category, this.items});
}

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(
    category: "Most Popular",
    items: [
      Menu(
        price: 7.4,
        image: "lib/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_1.png",
        title: "Chow Fun",
      ),
      Menu(
        price: 8.5,
        image: "lib/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 12.4,
        image: "lib/images/f_3.png",
        title: "Cookie Sandwich",
      ),
    ],
  ),
  CategoryMenu(
    category: "Beef & Lamb",
    items: [
      Menu(
        price: 7.4,
        image: "lib/images/f_4.png",
        title: "Combo Burger",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        price: 8.5,
        image: "lib/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 12.4,
        image: "lib/images/f_3.png",
        title: "Oyster Dish",
      ),
    ],
  ),
  CategoryMenu(
    category: "Seafood",
    items: [
      Menu(
        price: 7.4,
        image: "lib/images/f_6.png",
        title: "Oyster Dish",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Menu(
        price: 8.5,
        image: "lib/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
  CategoryMenu(
    category: "Appetizers",
    items: [
      Menu(
        price: 8.5,
        image: "lib/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 7.4,
        image: "lib/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        price: 12.4,
        image: "lib/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_1.png",
        title: "Chow Fun",
      ),
    ],
  ),
  CategoryMenu(
    category: "Dim Sum",
    items: [
      Menu(
        price: 9.0,
        image: "lib/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        price: 12.4,
        image: "lib/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 8.5,
        image: "lib/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 7.4,
        image: "lib/images/f_6.png",
        title: "Oyster Dish",
      ),
      Menu(
        price: 9.0,
        image: "lib/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Menu(
        price: 8.5,
        image: "lib/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
];
