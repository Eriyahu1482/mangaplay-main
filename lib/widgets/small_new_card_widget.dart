import 'package:flutter/material.dart';
import 'package:mangaplay/models/manga.dart';
import 'package:mangaplay/pages/detail_manga_page.dart';
import 'package:mangaplay/widgets/arrow_button_widget.dart';

class SmallNewCardWidget extends StatelessWidget {
  final Manga manga;

  const SmallNewCardWidget({
    super.key,
    required this.manga,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailMangaPage(manga: manga)));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(49, 49, 57, 0.7),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.zero,
                  width: 100,
                  height: 100,
                  child: Image.asset(manga.mangaImageUrl)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(manga.mangaTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 5,),
                  Text(manga.mangaGenres,
                      style: const TextStyle(
                          
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: ArrowButtonWidget(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailMangaPage(manga: manga)));}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}