import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {

  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  double sayi1 = 0;
  double sayi2 = 0;
  double sonuc = 0;
  var tfControlSayi1 = TextEditingController();
  var tfControlSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hesap Makinesi"),),
      body: Center(
        child: Column(
          children: [
            Text("Sonuç $sonuc"),
            SizedBox(width: 50,height: 50,
              child: TextField(
                controller: tfControlSayi1,
                decoration: const InputDecoration(hintText: "Sayı1"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),

            SizedBox(width: 50,height: 50,
              child: TextField(
                controller: tfControlSayi2,
                decoration: const InputDecoration(hintText: "Sayı2"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i =1; i<=5; i++)
                    ElevatedButton(onPressed: () => onRakamTiklama(i), child: Text("$i"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i =5; i<=9; i++)
                    ElevatedButton(onPressed: () => onRakamTiklama(i), child: Text("$i"))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(onPressed: () {
                toplamaIslemi();
              }, child: const Text("Topla")),
            ),
          ],
        ),
      ),
    );
  }

  void onRakamTiklama(int rakam) {
    String sayi1 = tfControlSayi1.text;
    String sayi2 = tfControlSayi2.text;

    if (sayi1.isEmpty) {
      tfControlSayi1.text = rakam.toString();
    } else if (sayi2.isEmpty) {
      tfControlSayi2.text = rakam.toString();
    }
  }
  void toplamaIslemi (){
    setState(() {
      sayi1 = double.tryParse(tfControlSayi1.text) ?? 0;
      sayi2 = double.tryParse(tfControlSayi2.text) ?? 0;
      sonuc = sayi1 + sayi2;
    });
}


}