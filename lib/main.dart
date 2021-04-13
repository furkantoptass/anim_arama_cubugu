import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anim search bar Example',
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController textController = TextEditingController();
  String aranan = ""; //Arama çubuguna girilen değer
  String arananEkran = ""; //Ekranda gösterilen Arama çubugundan alınan veri
  Color color = Colors.deepOrange[100]; //Arkaplan rengi değiştirmek için

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, //arka plan rengini biz belirliyoruz.
      appBar: AppBar(
        title: Text("Webmaster.Kitchen"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Animasyonlu Arama Çubuğu",
                style: Theme.of(context).textTheme.headline5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            //Aşağıda arama yapıldıgında arama yapılan kelimeyi ekran da göstrecektir.
            child: Center(
              child: Text("$arananEkran",
                  style: Theme.of(context).textTheme.overline),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
        child: AnimSearchBar(
          width: 400, //Arama çubuğu uzunlugu için düzenlenebilir
          helpText:
              "Arama...", //Arama bölümüne giriş olmadığında görülecek olan yazı
          textController: textController, //Girilen kelimeler
          suffixIcon: Icon(Icons.search), //Arama simgesi

          //Arama simgesine tıklama olayı aşağıdadır.
          onSuffixTap: () {
            setState(() {
              aranan = textController.text
                  .toString(); //Girilen kelimeyi aranan adlı değişkenine atıyoruz.

              if (aranan ==
                  "webmasterkitchen") //Girilen kelime webmasterkitchen a eşitse
              {
                color = Colors.amber[100]; //Arkaplan rengini değiştiriyoruz.
              } else {
                color = Colors.deepOrange[100]; //Webmasterkitchen a eşit değise
              }
              arananEkran =
                  "Aranan Kelime : " + aranan; //normal rengini veriyoruz.
              textController
                  .clear(); //Arama sonrası text inputun içini siliyoruz.
            });
          },
        ),
      ),
    );
  }
}
