import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Widget Flutter", 
      home: MainNavigationPage(),
    );
  }
}




class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  //Daftar 3 Halaman Utama
  final List<Widget> _pages =[
    const ProfilePage(),
    const JadwalPage(),
    const PengaturanPage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Siswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Jadwal', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan', 
          ),
        ],
      ),
    );
  }
}




class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartu Siswa"),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(child: MyProfileCardPage(nama: "Beauty", kelas: "XI RPL 7")),
            Expanded(child: MyProfileCardPage(nama: "Chalysta", kelas: "XI RPL 7")),
          ],
        ),
      ),
    );
  }
}




class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Pelajaran'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 60, color: Colors.deepPurple,),
            SizedBox(height: 12,),
            Text('Halaman Jadwal Pelajaran', style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}




class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 60, color: Colors.deepPurple,),
            SizedBox(height: 12,),
            Text('Halaman Pengaturan Aplikasi', style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}




class MyProfileCardPage extends StatefulWidget {
  final String nama;
  final String kelas;
  const MyProfileCardPage({required this.nama, required this.kelas});

  @override
  State<MyProfileCardPage> createState() => _MyProfileCardPageState();
}

class _MyProfileCardPageState extends State<MyProfileCardPage> {
  bool isFavorite1 = false; //variabel dengan tipe data boolean
  bool isFavorite2 = false; //variabel dengan tipe data boolean

  void toogleFavorite() {
    setState(() {
      isFavorite1 = !isFavorite1; //false=>true true=>false
    });
  }

  void toogleFavorite2() {
    setState(() {
      isFavorite2 = !isFavorite2; //false=>true true=>false
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProfilePage(nama: widget.nama, kelas: widget.kelas),
          ),
        );
      },
      child: Expanded(
        child: Container(
          width: 300,
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.nama,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.kelas),
                  const Text('beauty12@gmail.com'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: toogleFavorite,
                          child: Text(
                            isFavorite1 ? 'Hapus Favorit' : 'Tambah Favorit',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    isFavorite1 ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class DetailProfilePage extends StatelessWidget {
  final String nama;
  final String kelas;

  const DetailProfilePage({super.key, required this.nama, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail $nama')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              nama,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              kelas,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
