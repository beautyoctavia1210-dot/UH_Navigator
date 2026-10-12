import 'package:flutter/material.dart';

void main() {
  runApp(const UlanganNavigator());
}

const Color ungu = Color(0xFF7C4DFF);
const Color unguMuda = Color(0xFFB388FF);
const Color warnaKartu = Color(0xFF1E1A26);


final List<Map<String, dynamic>> daftarGadget = [
  {'nama': 'Smartphone', 'harga': 3500000, 'rating': 4.7, 'ikon': Icons.smartphone, 'warna': const Color(0xFF7C4DFF)},
  {'nama': 'Laptop', 'harga': 8500000, 'rating': 4.8, 'ikon': Icons.laptop_mac, 'warna': const Color(0xFF00B0FF)},
  {'nama': 'Smartwatch', 'harga': 750000, 'rating': 4.5, 'ikon': Icons.watch, 'warna': const Color(0xFF00C853)},
  {'nama': 'Headphone', 'harga': 450000, 'rating': 4.4, 'ikon': Icons.headphones, 'warna': const Color(0xFFFF6D00)},
  {'nama': 'Tablet', 'harga': 2800000, 'rating': 4.6, 'ikon': Icons.tablet_mac, 'warna': const Color(0xFFE040FB)},
  {'nama': 'Earbuds', 'harga': 350000, 'rating': 4.3, 'ikon': Icons.earbuds, 'warna': const Color(0xFFFF4081)},
];


String rupiah(int angka) {
  final teks = angka.toString();
  final hasil = StringBuffer();
  for (int i = 0; i < teks.length; i++) {
    if (i > 0 && (teks.length - i) % 3 == 0) {
      hasil.write('.');
    }
    hasil.write(teks[i]);
  }
  return 'Rp$hasil';
}


BoxDecoration gradasi(Color warna) {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [warna.withAlpha(220), warna.withAlpha(70)],
    ),
  );
}

class UlanganNavigator extends StatelessWidget {
  const UlanganNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ulangan Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ungu,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121016),
      ),
      // Named routes
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}

// ======================= LOGIN PAGE =======================
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.login_rounded, size: 84, color: ungu),
              const SizedBox(height: 12),
              const Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const Text(
                'Selamat Datang di TechExpress',
                style: TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Masuk', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================= MAIN PAGE =======================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tab = 0; // 0 = Katalog, 1 = Profile

  final List<Widget> _halaman = const [
    KatalogPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _halaman[_tab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        backgroundColor: const Color(0xFF1A1620),
        selectedItemColor: ungu,
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          setState(() {
            _tab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Katalog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ======================= KATALOG PAGE =======================
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TechExpress Store',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Pilih gadget favoritmu',
                style: TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C4DFF), Color(0xFF512DA8)],
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.local_offer, size: 34),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text('Promo Spesial: klaim voucher diskon 10% atau 20%'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: daftarGadget.length,
            itemBuilder: (context, index) {
              final gadget = daftarGadget[index];
              final String nama = gadget['nama'] as String;
              final int harga = gadget['harga'] as int;
              final double rating = gadget['rating'] as double;
              final IconData ikon = gadget['ikon'] as IconData;
              final Color warna = gadget['warna'] as Color;

              
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        nama: nama,
                        harga: harga,
                        rating: rating,
                        ikon: ikon,
                        warna: warna,
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  color: warnaKartu,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: gradasi(warna),
                          child: Icon(ikon, size: 64, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nama,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, size: 14, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text('$rating', style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                rupiah(harga),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: unguMuda,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ======================= DETAIL PAGE =======================
class DetailPage extends StatefulWidget {
  final String nama;
  final int harga;
  final double rating;
  final IconData ikon;
  final Color warna;

  // Data diterima lewat constructor
  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.rating,
    required this.ikon,
    required this.warna,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _voucher = '-'; 
  int _persen = 0; 

  
  void _pilihVoucher() {
    showModalBottomSheet(
      context: context,
      backgroundColor: warnaKartu,
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Voucher Anda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.local_offer, color: ungu),
                title: const Text('Diskon 10%'),
                onTap: () {
                  
                  setState(() {
                    _voucher = 'Diskon 10%';
                    _persen = 10;
                  });
                  Navigator.pop(sheetContext);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer, color: ungu),
                title: const Text('Diskon 20%'),
                onTap: () {
                  setState(() {
                    _voucher = 'Diskon 20%';
                    _persen = 20;
                  });
                  Navigator.pop(sheetContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int hargaVoucher = widget.harga - (widget.harga * _persen ~/ 100);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            decoration: gradasi(widget.warna),
            child: Icon(widget.ikon, size: 130, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama: ${widget.nama}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text('${widget.rating} / 5'),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Harga: ${rupiah(widget.harga)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: unguMuda,
                  ),
                ),
               if (_persen > 0)
                Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      'Harga dengan voucher: ${rupiah(hargaVoucher)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent,
                      ),
                    ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: warnaKartu,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Voucher: $_voucher',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: _pilihVoucher,
                          icon: const Icon(Icons.card_giftcard),
                          label: const Text('Klaim Voucher Diskon'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================= PROFILE PAGE =======================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Center(
          child: Icon(Icons.account_circle, size: 100, color: ungu),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF7C4DFF), Color(0xFF512DA8)],
            ),
          ),
          child: const Column(
            children: [
              Text(
                'TechExpress',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Kode Member', style: TextStyle(color: Colors.white70)),
              Text(
                'TE-2026-001',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        SizedBox(
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Log Out'),
          ),
        ),
      ],
    );
  }
}