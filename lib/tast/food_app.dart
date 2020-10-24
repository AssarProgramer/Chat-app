import 'package:flutter/material.dart';

class FoodApp extends StatelessWidget {
  Widget topPart() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assar Baloch',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/proxy/TJ8DGYiddAVut5KW30ArU_CGQQ2qw9ZEdnZHdkquG2166l9_CEA1pvihtU0tAhg_sx6i70dw2i8ASZD97937OBhnMC5mSpOLVzad4d2FbGpGXSDLFp7f8l3N_dJpyI2uyeE_'),
              ),
            ],
          ),
          Text(
            'Developer in All Pakistan',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget singleFood({
    String image,
    String name,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xfffffefb),
            backgroundImage: NetworkImage(
              image,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget singleContainer({
    String image,
    String title,
    String subtitle,
    String maker,
    String mint,
    Color color,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 400,
      width: 280,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
              ),
            ),
          ),
          Text(
            maker,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            mint,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topPart(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 40),
            height: 120,
            color: Color(0xfffff3ec),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleFood(
                    name: 'All',
                    image:
                        'https://images-na.ssl-images-amazon.com/images/I/51NaZfWI11L._AC_SX522_.jpg',
                  ),
                  singleFood(
                    name: 'Chicken',
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaCFPStB6-GajYUzBe_tdnYguk6TN5qUz4og&usqp=CAU',
                  ),
                  singleFood(
                      name: 'Burger',
                      image:
                          'https://img1.mashed.com/img/gallery/fast-food-hamburgers-ranked-worst-to-best/intro-1540401194.jpg'),
                  singleFood(
                      name: 'Pizza',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcScWZJ54CSMCCiYw3lQ03rXjm47uIyn3WAbiw&usqp=CAU'),
                  singleFood(
                    name: 'Chicken',
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaCFPStB6-GajYUzBe_tdnYguk6TN5qUz4og&usqp=CAU',
                  ),
                  singleFood(
                    name: 'Chicken',
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaCFPStB6-GajYUzBe_tdnYguk6TN5qUz4og&usqp=CAU',
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleContainer(
                    color: Color(0xfffdcdb7),
                    image:
                        'https://lh3.googleusercontent.com/proxy/TJ8DGYiddAVut5KW30ArU_CGQQ2qw9ZEdnZHdkquG2166l9_CEA1pvihtU0tAhg_sx6i70dw2i8ASZD97937OBhnMC5mSpOLVzad4d2FbGpGXSDLFp7f8l3N_dJpyI2uyeE_',
                    maker: 'assar',
                    mint: '30 m',
                    subtitle: 'Mixcher Food',
                    title: 'On Pakistan'),
                Container(
                  height: 380,
                  child: singleContainer(
                      color: Color(0xfffbe5e7),
                      image:
                          'https://lh3.googleusercontent.com/proxy/TJ8DGYiddAVut5KW30ArU_CGQQ2qw9ZEdnZHdkquG2166l9_CEA1pvihtU0tAhg_sx6i70dw2i8ASZD97937OBhnMC5mSpOLVzad4d2FbGpGXSDLFp7f8l3N_dJpyI2uyeE_',
                      maker: 'assar',
                      mint: '30 m',
                      subtitle: 'Mixcher Food',
                      title: 'On Pakistan'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
