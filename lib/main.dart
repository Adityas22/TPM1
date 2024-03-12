import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                // Contoh sederhana: Cek apakah username dan password sesuai
                if (usernameController.text == 'admin' &&
                    passwordController.text == 'admin') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenu(),
                    ),
                  );
                } else {
                  // Tampilkan pesan error jika login gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login Gagal. Coba lagi.'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        // Wrap the Column with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Pindah ke halaman Data Kelompok
                // Tambahkan logika atau widget sesuai kebutuhan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataKelompok(),
                  ),
                );
              },
              child: Text('Data Kelompok'),
            ),
            ElevatedButton(
              onPressed: () {
                // Pindah ke halaman Penjumlahan dan Pengurangan Angka
                // Tambahkan logika atau widget sesuai kebutuhan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Kalkulator(),
                  ),
                );
              },
              child: Text('Penjumlahan dan Pengurangan Angka'),
            ),
            ElevatedButton(
              onPressed: () {
                // Pindah ke halaman Input Bilangan Ganjil/Genap
                // Tambahkan logika atau widget sesuai kebutuhan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GanjilGenap(),
                  ),
                );
              },
              child: Text('Input Bilangan Ganjil/Genap'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataKelompok extends StatelessWidget {
  // Define your list of data kelompok here
  final List<Map<String, String>> dataKelompok = [
    {'name': 'Aditya Septiawan', 'nim': '123210014'},
    {'name': 'Rayhan Fairuz Sakha', 'nim': '123210028'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
      ),
      body: ListView.builder(
        itemCount: dataKelompok.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Name: ${dataKelompok[index]['name']}'),
            subtitle: Text('NIM: ${dataKelompok[index]['nim']}'),
          );
        },
      ),
    );
  }
}

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  double num1 = 0;
  double num2 = 0;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                num1 = double.tryParse(value) ?? 0;
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Bilangan 1'),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                num2 = double.tryParse(value) ?? 0;
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Bilangan 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = num1 + num2;
                    });
                  },
                  child: Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = num1 - num2;
                    });
                  },
                  child: Text('Kurang'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class GanjilGenap extends StatefulWidget {
  @override
  _GanjilGenapState createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  TextEditingController _num1Controller = TextEditingController();
  double result = 0;
  var status = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Angka'),
        // Tambahkan tombol kembali pada AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan bilangan',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _check,
                  child: Text('Check'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '$status',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  void _check() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    setState(() {
      result = num1 % 2;
      if (result == 0) {
        status = "Genap";
      } else {
        status = "Ganjil";
      }
    });
  }
}
