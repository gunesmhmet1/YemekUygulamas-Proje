// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek_app/screens/order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://cdn.yemek.com/mnresize/1250/833/uploads/2015/01/sucuklu-pizza-yeni-onecikan.jpg',
    'https://www.unileverfoodsolutions.com.tr/konsept-uygulamalarimiz/sokak-lezzetleri/hamburger-malzemesi-secerken/jcr:content/parsys/content/textimage_copy_copy_628821058/image.transform/jpeg-optimized/image.1552661787858.jpg',
    'https://i.lezzet.com.tr/images-xxlarge-recipe/tavuk-doner-d35e16f6-d541-4a18-a766-1ab3e5368e86.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGeXV6kToGVq9sCzjNxji8Q_SrX-LDtdYgjveddiPDkemkDI5jCZLX4Qia51SW0uN1wGg&usqp=CAU',
    'https://st2.myideasoft.com/idea/bf/88/myassets/products/014/misafirliq-kahvalti-tepsisi.jpg?revision=1676894557',
  ];

  String? selectedMenuItem;
  bool isChipSelected = false;
  bool isChipSelected1 = false;
  bool isChipSelected2 = false;
  bool isChipSelected3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        elevation: 0.0,
        title: const Text("Bi Ev Yemek"),
        leading: const Icon(Icons.restaurant_menu_outlined),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.red.shade800,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Merhaba,',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Ahmet',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Oldukça acıkmış gözüküyorsun',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.workspace_premium_rounded,
                          size: 32,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).push('/order');
                          },
                          icon: Icon(
                            Icons.shopping_basket,
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 80,
                  width: 150,
                  color: Colors.blueGrey.shade500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.fastfood_outlined,
                        color: Colors.white,
                      ),
                      const Text(
                        'Seçilmiş Menüler',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 80,
                  width: 150,
                  color: Colors.blueGrey.shade500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.flourescent_outlined,
                        color: Colors.white,
                      ),
                      const Text(
                        'Fırsat Menüleri',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final imageUrl = images[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200.0,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButton<String>(
            value: selectedMenuItem,
            hint: const Text('İlçeler:'),
            dropdownColor: Colors.white,
            onChanged: (String? value) {
              setState(() {
                selectedMenuItem = value;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Şişli',
                child: const Text('Şişli'),
              ),
              DropdownMenuItem(
                value: 'Bakırköy',
                child: const Text('Bakırköy'),
              ),
              DropdownMenuItem(
                value: 'Gaziosmanpaşa',
                child: const Text('Gaziosmanpaşa'),
              ),
              DropdownMenuItem(
                value: 'Beşiktaş',
                child: const Text('Beşiktaş'),
              ),
              DropdownMenuItem(
                value: 'Nişantaşı',
                child: const Text('Nişantaşı'),
              ),
              DropdownMenuItem(
                value: 'Kağıthane',
                child: const Text('Kağıthane'),
              ),
              DropdownMenuItem(
                value: 'Ataşehir',
                child: const Text('Ataşehir'),
              ),
              DropdownMenuItem(
                value: 'Maltepe',
                child: const Text('Maltepe'),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(spacing: 8.0, runSpacing: 8.0, children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isChipSelected = !isChipSelected;
                });
              },
              child: Chip(
                label: const Text(
                  'Ana Yemek',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor:
                    isChipSelected ? Colors.blue : Colors.blueGrey.shade500,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChipSelected1 = !isChipSelected1;
                });
              },
              child: Chip(
                label: const Text(
                  'Tatlı',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor:
                    isChipSelected1 ? Colors.blue : Colors.blueGrey.shade500,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChipSelected2 = !isChipSelected2;
                });
              },
              child: Chip(
                label: const Text(
                  'Ev Yemeği',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor:
                    isChipSelected2 ? Colors.blue : Colors.blueGrey.shade500,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChipSelected3 = !isChipSelected3;
                });
              },
              child: Chip(
                label: const Text(
                  'Fast Food',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor:
                    isChipSelected3 ? Colors.blue : Colors.blueGrey.shade500,
              ),
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          InkWell(
            child: Container(
              width: double.infinity,
              height: 55,
              color: Colors.white54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Önceki Siparişlerim',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                ListTile(
                  leading: Image.network(
                      'https://cdn.yemek.com/mnresize/940/940/uploads/2022/08/100-gram-kiymayla-karniyarik-one-cikan.jpg'),
                  title: Text("Karnıyarık"),
                  subtitle: Text('Ayşe Teyze'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
                ListTile(
                  leading: Image.network(
                      'https://www.pratikevyemekleri.com/wp-content/uploads/2021/12/nohutlu-tavuklu-pilav.jpg'),
                  title: Text('Tavuklu Pilav'),
                  subtitle: Text('Mehmet Amca'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
                ListTile(
                  leading: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMueeox0YQXNCo19TZZlCva5CWfgom-z4Wepv6CJOHxhln3FnMMAjGo104Y26ZDaImg6U&usqp=CAU'),
                  title: Text('Sucuklu Pide'),
                  subtitle: Text('Fatma Teyze'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
                ListTile(
                  leading: Image.network(
                      'https://www.tarifdefteri.org/wp-content/uploads/2022/12/Asla-Dagilmayan-Kofteli-Patates-Yemegi-Tarifi.jpg'),
                  title: Text('Sulu Köfte'),
                  subtitle: Text('Kadriye Teyze'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
                ListTile(
                  leading: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOiI5xQ_SORzNCYUg5ym7Bcsa2lQfLecmNfWlmiQ7xdUZsbt-vRAGByq7e54pdSStdsPY&usqp=CAU'),
                  title: Text('Peynirli Börek'),
                  subtitle: Text('İrem Abla'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
                ListTile(
                  leading: Image.network(
                      'https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg'),
                  title: Text('Mantı'),
                  subtitle: Text('Hatice Anne'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle onTap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
