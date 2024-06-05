import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'detailed_sreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  var list = [];
  int selected = 0;
  TextEditingController textSearchProduct = TextEditingController();
  List<String> listLoai = [
    'Tất Cả',
    'Máy Tính',
    'Điện Thoại',
    'Phụ Kiện',
    'Màn Hình'
  ];

  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      var response = await dio.get("http://demo5058712.mockable.io/thuc");
      if (response.statusCode == 200) {
        setState(() {
          list = response.data["Phone"];
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  controller: textSearchProduct,
                  decoration: const InputDecoration(
                    hintText: 'Tìm Kiếm Sản Phẩm',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'NotoSansRegular',
                        fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ),
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        ),
      ),
      body: list.isNotEmpty
          ? Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                      listLoai.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ChoiceChip(
                          selectedColor: Colors.blueGrey,
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(
                              fontFamily: 'NotoSansRegular',
                              color: selected == index
                                  ? Colors.white
                                  : Colors.black),
                          label: Text("${listLoai[index]}"),
                          selected: selected == index,
                          onSelected: (bool newSelected) {
                            setState(() {
                              selected = (newSelected ? index : null)!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: list.isEmpty ? 0 : list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailedScreen(
                                  images: list[index]["images"],
                                  titles: list[index]["title"],
                                  bodys: list[index]["body"],
                                  prices: list[index]["price"],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Card(
                              child: ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: Image.network(
                                        "${list[index]["images"]}")),
                                title: Text(
                                  "${list[index]["title"]}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSansRegular'),
                                ),
                                subtitle: Text(
                                  "${list[index]["body"]}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NotoSansRegular'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Text(
                                  "${list[index]["price"]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.brown[800],
                                      fontFamily: 'NotoSansRegular'),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
