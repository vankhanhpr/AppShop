import 'package:flutter/material.dart';

class DrawerHome extends StatefulWidget {
  DrawerHome({Key key}) : super(key: key);

  @override
  _DrawerHome createState() => _DrawerHome();
}

class _DrawerHome extends State<DrawerHome>{

  @override
  Widget build(BuildContext context) {
    var view = Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                     "asset/img/account.png",
                    width: 60,
                    height: 60,
                  ),
                  title: Text('Login',
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      )),
                  onTap: (){
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                      // );
                  },
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Image.asset(
                    "asset/img/account.png",
                    width: 25.0,
                    height: 25.0,
                    color: Color(0xff5C5C5C),
                  ),
              title: Text('Settings',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff5C5C5C),
                  )),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                    "asset/img/account.png",
                    width: 25.0,
                    height: 25.0,
                    color: Color(0xff5C5C5C),
                  ),
              title: Text('Send feedback',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff5C5C5C),
                  )),
              onTap: () {
                // Then close the drawe
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1.0,
            ),
          ],
        ),
      );
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,//20.0, 
        child:view,
    );
  }
}