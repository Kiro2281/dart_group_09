import 'package:flutter/material.dart';

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myAppScreen(),
    );
  }
}

class myAppScreen extends StatefulWidget {
  @override
  State<myAppScreen> createState() => myAppScreenState();
}

class myAppScreenState extends State<myAppScreen> {
  final TextEditingController first = TextEditingController();

  String name = "";
  String submittedName = "";
  bool isSent = false;

  void sendForm() {
    final trimmedName = name.trim();

    if (trimmedName.isEmpty) return;

    setState(() {
      submittedName = trimmedName;
      isSent = true;
      first.clear();
      name = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Обратная связь'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Напишите нам',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Введите ваше имя и нажмите кнопку отправки.'),
            const SizedBox(height: 32),
            TextField(
              controller: first,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                name = value;
                if (isSent) {
                  setState(() {
                    isSent = false;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ваше имя',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.tealAccent,
                    width: 1.0,
                  ),
                ),
                 focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: sendForm,
                child: const Text('Отправить'),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            if (isSent && submittedName.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Отправлено! Спасибо, $submittedName',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            ),
          ],
        ),
      ),
    );
  }
}