import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool hidePassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //Penulisan function menggunakan lowerCamelCase
  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
      //false => lawan dari false
    });
  }

  late String name;
  late IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hallo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person_outline_rounded,
            color: Colors.brown,
          ),
          const Text(
              'Yeay, Terima kasih aduan yang telah anda kirimkan. Kami akan segara tinjau aduan anda.',
              textAlign: TextAlign.center),
          //Todo: Membuat TextField
          //Candraa
          TextField(
            controller: nameController,
            keyboardType: TextInputType.name,
            onSubmitted: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('NAMA KAMU ADALAH $value')));
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_outline_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Nama',
            ),
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('EMAIL KAMU ADALAH $value')));
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Email',
            ),
          ),
          TextField(
            obscureText: hidePassword,
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('EMAIL KAMU ADALAH $value')));
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password_outlined),
              suffixIcon: GestureDetector(
                onTap: () {
                  changePasswordVisibility();
                },
                child: Icon(
                  (hidePassword) ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Password',
            ),
          ),

          //Todo: Membuat Radio

          //Todo: Checkbox

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
            ),
            child: const Text("Mulai Belanja"),
          )
        ],
      ),
    );
  }
}
