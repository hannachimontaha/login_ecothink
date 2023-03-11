
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var _display = 'Home Selected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:  AppBar(
          title: Text("Welcome"),
          backgroundColor: Colors.purple,
          actions: [

            PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
                itemBuilder: (context){
                  return [

                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Logout"),
                    ),
                  ];
                },
                onSelected:(value){

                }

            ),

          ],
        ),
        body: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          children: [
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/chambre.jpg'),
                  ),
                  ListTile(
                    title: Text("Chambres et suites",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/restau.png'),
                  ),
                  ListTile(
                    title: Text("Restaurants et Bars",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/reunion.png'),
                  ),
                  ListTile(
                    title: Text("Réunions et Evenements",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/spa.jpg'),
                  ),
                  ListTile(
                    title: Text("Thalasso et SPA",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/golf.jpg'),
                  ),
                  ListTile(
                    title: Text("Golf",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/stade.png'),
                  ),
                  ListTile(
                    title: Text("Complexe Sportif",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home, color: Colors.white)
            ),
            BottomNavigationBarItem(
              label: 'Activities',
              icon: Icon(Icons.volunteer_activism, color: Colors.white),

            ),
            BottomNavigationBarItem(
                label: 'Reservations',
                icon: Icon(Icons.room_service_outlined, color: Colors.white))
          ],
          backgroundColor: Colors.purple,
          currentIndex: _selectedIndex,
          onTap: _setDisplayed,
          // ),
          // body: Center(
          //   child: ElevatedButton(
          //     child: Text("Logout"),
          //     onPressed: () {
          //       FirebaseAuth.instance.signOut().then((value) {
          //       print("Signed Out");
          //        Navigator.push(context,
          //          MaterialPageRoute(builder: (context) => SignInScreen()));
          //       });
          //     },
          //   ),
          // ),
        ));
  }
  void _setDisplayed(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            _selectedIndex = 0;
            _display  = Navigator.pushNamed(context, "/home") as String;
          }
          break;
        case 1:
          {
            _selectedIndex = 1;
            _display  = Navigator.pushNamed(context, "/activites") as String;
          }
          break;
        case 2:
          {
            _selectedIndex = 0;
            _display  = Navigator.pushNamed(context, "/reservations") as String;
          }
          break;
      }
    });
  }
}