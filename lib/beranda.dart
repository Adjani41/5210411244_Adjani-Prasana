import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Ganti warna utama menjadi lebih lembut
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50], // Latar belakang lebih terang
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AkunPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.teal, // Warna aktif lebih lembut
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, size: 28),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.account_circle, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, size: 30),
            onPressed: () {
              print("Notifikasi ditekan");
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, size: 30),
            onPressed: () {
              print("Setting ditekan");
            },
          ),
        ],
        backgroundColor: Colors.teal, // Ubah warna app bar menjadi teal
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 150,
              margin: EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.teal[100], // Warna card lebih lembut
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Artist $index',
                          style: TextStyle(
                            color: Colors.black87, // Warna teks lebih gelap
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Song Title $index',
                          style: TextStyle(
                            color: Colors.black54, // Warna teks lebih lembut
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[100], // Latar belakang lebih terang
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal[50], // Warna card lebih lembut
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage('assets/image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Headline $index',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Ini adalah deskripsi singkat untuk item ke-$index.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_box,
                                            color: Colors.black54,
                                            size: 16,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            'Today',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.teal,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/image.png'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Adjani Prasana',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Warna lebih lembut
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Universitas Teknologi Yogyakarta',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildMenuItem(Icons.account_circle, 'Kelola Akun', context),
              _buildMenuItem(Icons.notifications, 'Notifikasi', context),
              _buildMenuItem(Icons.privacy_tip, 'Privacy Policy', context),
              _buildMenuItem(Icons.article, 'Terms of Service', context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
      onTap: () {
        print('$title ditekan');
      },
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.teal, // Ubah warna app bar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/image.png'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Adjani Prasana',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Warna lebih lembut
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Universitas Teknologi Yogyakarta',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildInfoRow(Icons.email, 'Email', 'adjaniprasana917@gmail.com'),
              _buildInfoRow(Icons.person, 'Nama', 'Adjani Prasana'),
              _buildInfoRow(Icons.phone, 'Nomor Telepon', '+6282213926113'),
              _buildInfoRow(Icons.location_on, 'Alamat', 'Gemawang'),
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Tombol lebih lembut
                  ),
                  child: Text(
                    'Ubah Profil',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 28),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Login',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
