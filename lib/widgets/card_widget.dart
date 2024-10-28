
import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/detail_manga_page.dart';
import 'package:mangaplay/widgets/arrow_button_widget.dart';

class CardWidget extends StatelessWidget {
  final Manga manga;

  const CardWidget({
    super.key,
    required this.manga,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailMangaPage(manga: manga)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 270, left: 5),
              width: 250,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(manga.mangaImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    width: 110,
                    child: Text(manga.mangaTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                            Shadow( // bottomLeft
                              offset: Offset(-1, -1),
                              color: Colors.black
                            ),
                            Shadow( // bottomRight
                              offset: Offset(1, -1),
                              color: Colors.black
                            ),
                            Shadow( // topRight
                              offset: Offset(1, 1),
                              color: Colors.black
                            ),
                            Shadow( // topLeft
                              offset: Offset(-1, 1),
                              color: Colors.black
                            ),
                          ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: ArrowButtonWidget(onTap: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}