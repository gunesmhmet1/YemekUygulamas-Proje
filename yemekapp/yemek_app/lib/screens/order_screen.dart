// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  String? selectedCity;
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siparişi Onayla'),
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        elevation: 1.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Container(
                height: 35,
                width: double.infinity,
                color: Colors.yellow.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sepet Detayı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Ürün Adı'),
                        Text('Adet'),
                        Text('Fiyat'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Kuru Fasulye + Pilav',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text('2'),
                        Text('100₺'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  color: Colors.yellow.shade700,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sipariş Tipi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: Text("Teslimat"),
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                      },
                    ),
                    Divider(),
                    CheckboxListTile(
                      title: Text("Gel-Al"),
                      value: isChecked2,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked2 = newValue ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  color: Colors.yellow.shade700,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Yeni Üyelik',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 470,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    TextFormField(
                      controller: t1,
                      decoration: InputDecoration(
                        labelText: 'Adınız',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bu alan boş bırakılamaz';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: t2,
                      decoration: InputDecoration(
                        labelText: 'Soyadınız',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bu alan boş bırakılamaz';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: t3,
                      decoration: InputDecoration(
                        labelText: 'E-Posta Adresiniz',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bu alan boş bırakılamaz';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: selectedCity,
                          hint: const Text('Şehir:'),
                          dropdownColor: Colors.white,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: 'İstanbul',
                              child: const Text('İstanbul'),
                            ),
                            DropdownMenuItem(
                              value: 'Ankara',
                              child: const Text('Ankara'),
                            ),
                            DropdownMenuItem(
                              value: 'İzmir',
                              child: const Text('İzmir'),
                            ),
                            DropdownMenuItem(
                              value: 'Bursa',
                              child: const Text('Bursa'),
                            ),
                            DropdownMenuItem(
                              value: 'Antalya',
                              child: const Text('Antalya'),
                            ),
                            DropdownMenuItem(
                              value: 'Bolu',
                              child: const Text('Bolu'),
                            ),
                            DropdownMenuItem(
                              value: 'Trabzon',
                              child: const Text('Trabzon'),
                            ),
                            DropdownMenuItem(
                              value: 'Adana',
                              child: const Text('Adana'),
                            ),
                          ],
                        ),
                        DropdownButton<String>(
                          value: selectedDistrict,
                          hint: const Text('İlçe:'),
                          dropdownColor: Colors.white,
                          onChanged: (String? value) {
                            setState(() {
                              selectedDistrict = value;
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
                              value: 'Sincan',
                              child: const Text('Sincan'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Üye Ol",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                      ),
                      onPressed: () {},
                      child: Text('Siparişi Tamamla'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
