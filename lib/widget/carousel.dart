import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'album.dart';

class Carousel extends StatefulWidget  {
  final List<Album>? listeAlbum;

  Carousel({Key? key, required this.listeAlbum}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.listeAlbum,
      carouselController: _controller,
      options: CarouselOptions(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.2,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }
      ),
    );
  }
}