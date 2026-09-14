import 'package:flutter/material.dart'; 

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Prifile',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name = 'Gojo Satoru';
  final String myCity = 'I\'m from Tokio';
  final String age = 'I\'m 28';
  final String description = 'The most powerful sorceer of modern times';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Profile'), 
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search),),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.menu),),
        ],
      ),
      body:
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/Satoru.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 22, 
                fontFamily: 'CustomMontserrat', 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              myCity,
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 16,
              fontFamily: 'CustomMontserrat', 
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              age,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0000FF),
                fontSize: 16,
                fontFamily: 'CustomMontserrat', 
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF800080),
                fontSize: 16,
                fontFamily: 'CustomMontserrat', 
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.camera_alt),
                color: Color(0xFFFFFFFF),
                iconSize: 30,
                onPressed: () {},),
                SizedBox(width: 12),
                IconButton(icon: Icon(Icons.alternate_email),
                color: Color(0xFFFFFFFF),
                iconSize: 30,
                onPressed: () {},),
                SizedBox(width: 12),
                IconButton(icon: Icon(Icons.videocam),
                color: Color(0xFFFFFFFF),
                iconSize: 30,
                onPressed: () {},),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text('Follow', style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
