import 'package:flutter/material.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  final _usernameController = TextEditingController();

  void _submit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reset Password'),
        content: Text('Link untuk reset password telah dikirim ke email Anda.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Password'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Judul dan deskripsi
                Column(
                  children: [
                    Icon(
                      Icons.lock_reset,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lupa Password',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black38,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Masukkan email Anda dan kami akan mengirim link pemulihan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Field input email
                _buildTextField(
                  label: 'Masukkan Email',
                  controller: _usernameController,
                ),
                SizedBox(height: 40),

                // Tombol kirim
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.redAccent],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Kirim',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            hintText: 'Email Anda',
            hintStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.white70),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
