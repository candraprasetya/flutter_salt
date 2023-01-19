import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool hidePassword = true;
  bool isAgree = false;
  String? groupValue;
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

  bool isProfileCompleted() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        groupValue!.isNotEmpty &&
        isAgree) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Image.network(
                'https://an-nur.ac.id/wp-content/uploads/2018/12/icon-pendaftaran-png.png',
                width: 120,
              ),
              const SizedBox(height: 24),
              const Text(
                  'Selamat datang, Silahkan isi semua formulir pendaftaran untuk melanjutkan pendaftaran akun.',
                  textAlign: TextAlign.center),
              const SizedBox(height: 16),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      value: "Laki-Laki",
                      groupValue: groupValue,
                      title: const Text("Laki-Laki"),
                      onChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      value: "Perempuan",
                      groupValue: groupValue,
                      title: const Text("Perempuan"),
                      onChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              CheckboxListTile(
                value: isAgree,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'Dengan mendaftar, saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi',
                  style: TextStyle(fontSize: 12),
                ),
                onChanged: (value) {
                  setState(() {
                    isAgree = value!;
                  });
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: isProfileCompleted()
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyHomeScreen(),
                              ));
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  Text(
                                    "Nama : ${nameController.text}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Email : ${emailController.text}"),
                                  Text("Gender : $groupValue"),
                                ],
                              );
                            },
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text("Daftar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
