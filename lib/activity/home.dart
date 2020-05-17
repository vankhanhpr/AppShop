import 'package:flutter/material.dart';
import './food/food_detail.dart';
import './model/food.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int selectedIndex = 0;
  final List<String> categories = [
    'Veg Dinner',
    'Non-Veg Dinner',
    'chicken Dinner',
    'Non-chicken Dinner'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      _buildTitleScreen(),
      _buildMenuTypeFood(),
      _buildSearchFavorite(),
      _buildRestaurantMain(context),
    ]);
  }

  Padding _buildRestaurantMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.width * 1,
        width: double.infinity,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FoodDetails(
                                food: foods[index],
                              )));
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  height: MediaQuery.of(context).size.width * .6,
                  width: MediaQuery.of(context).size.width * .68,
                  //padding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 180.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                ),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(foods[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        foods[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'lato',
                          fontSize: 20.0,
                          color: Color(0xFF444444),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          foods[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '1 Person per plate',
                        style:
                            TextStyle(color: Color(0xFF404040), fontSize: 16.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Just',
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontFamily: 'lato',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFCA60)),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '\$${foods[index].price}',
                              style: TextStyle(
                                color: Color(0xFFFFCA60),
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Padding _buildSearchFavorite() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Color(0xFFFFCA60).withOpacity(0.6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFCA60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildMenuTypeFood() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: index == selectedIndex
                        ? Color(0xFFFFCA60)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Color(0xFFFFCA60),
                        fontSize: 16.0,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Padding _buildTitleScreen() {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10.0),
            //color: Colors.red,
            child: Text(
              'Choose The Food you love',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFCA60),
                fontFamily: 'lato',
              ),
            )));
  }

}
