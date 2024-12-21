import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/services/manga_provider.dart';
import 'package:mangaplay/widgets/main_button.dart';
import 'package:provider/provider.dart';

class DetailMangaPage extends StatefulWidget {
  final Manga manga;

  const DetailMangaPage({super.key, required this.manga});
  // Объявляем список для просмотренных манг как статический
  static final List<Manga> watchedModel = [];

  @override
  State<DetailMangaPage> createState() => _DetailMangaPageState();
}

class _DetailMangaPageState extends State<DetailMangaPage> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.manga.mangaImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.transparent,
                child: GestureDetector(
  onTap: () {
    Navigator.pop(context); 
  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(17, 20, 24, 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0))),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 9),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 460,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 6,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                //Descriptions
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text('Годы выхода:',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                                  Text(widget.manga.mangaYear,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Описание',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 342,
                          height: 217,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(17, 20, 24, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(70, 51, 111, 1),
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                          child: Container(
                            margin: EdgeInsets.zero,
                            width: 310,
                            height: 190,
                            child:  SingleChildScrollView(
                                child: Text(
                                    widget.manga.mangaDescription,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainButtonWidget(
                                buttonName: 'Добавить в просмотренное',
                                buttonColor: const Color.fromRGBO(70, 51, 111, 1),
                                buttonTextColor: Colors.white,
                                buttonShadowColor: Colors.transparent,
                                onTap: () {
                                  final mangaProvider = Provider.of<MangaProvider>(context, listen: false);
                                  mangaProvider.addManga(widget.manga);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${widget.manga.mangaTitle} добавлена в просмотренное')),
                                  );
                  
                },
              ),
            ],
          ),
                  ]
        ),
      ),
            ]
    )
  )
      )
);
  }
}