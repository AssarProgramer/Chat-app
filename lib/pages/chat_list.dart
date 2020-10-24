import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  Widget listTile({String name, String image}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(
          name,
          style: TextStyle(
              color: Color(
                0xffb1aeae,
              ),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Color(0xff5e7bfd),
        elevation: 0.0,
        // title:
        centerTitle: true,
        leading: Image.asset(
          'images/appbar.jpg',
          fit: BoxFit.fill,
        ),
        title: Image.asset(
          'images/appbar.jpg',
          fit: BoxFit.fill,
        ),

        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundchat.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search'),
              ),
              listTile(
                image: '',
                name: 'assa',
              ),
              Divider(
                color: Colors.black,
                indent: 75,
              ),
              listTile(
                image: '',
                name: 'assa',
              ),
              Divider(
                color: Colors.black,
                indent: 75,
              ),
              listTile(
                image: '',
                name: 'assa',
              ),
              Divider(
                color: Colors.black,
                indent: 75,
              ),
              listTile(
                image: '',
                name: 'assa',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
