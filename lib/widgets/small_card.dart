
import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/detail_manga_page.dart';

class SmallHitsCardWidget extends StatelessWidget {
  final Manga manga;

  const SmallHitsCardWidget({
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
              width: 150,
              height: 250,
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
                            fontWeight: FontWeight.bold)),
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