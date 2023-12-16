import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

///Need to work on screens images
class HorizontalImgScrollAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HorizontalImgScrollAnimationState();
  }
}

class _HorizontalImgScrollAnimationState
    extends State<HorizontalImgScrollAnimation> {
  PageController? _pageController;
  int _selectedPage = 0;
  List imageUrl = [
    "https://www.stellarinfo.com/blog/wp-content/uploads/2021/04/Featured-Which-Image-Formats-is-Better-PNG-vs-JPG.jpg",
    "https://www.techsmith.com/blog/wp-content/uploads/2017/02/JPG-v-PNG-Zion-National-Park.jpg",
    "https://tinyjpg.com/images/social/website.jpg",
    "https://images.wondershare.com/repairit/aticle/2021/08/png-jpg-or-jpeg-2.jpg",
    "https://www.sodapdf.com/blog/wp-content/uploads/2021/10/When-should-I-use-PNG-or-JPG-1280x720.jpg"
        "https://images.wondershare.com/repairit/aticle/2021/08/png-jpg-or-jpeg-4.jpg"
  ];
  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5,
    )..addListener(_updateSelectedPage);
  }

  void _updateSelectedPage() {
    final closestPage = _pageController!.page!.round();
    final isClosestPageSelected =
        (_pageController!.page! - closestPage).abs() < 0.2;
    final selectedPage = isClosestPageSelected ? closestPage : null;
    if (_selectedPage != selectedPage) {
      setState(() {
        _selectedPage = selectedPage ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Horizontal scroll images "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: (imageUrl.length / 2).round(),
            options:
                CarouselOptions(enlargeCenterPage: false, viewportFraction: 1),

            itemBuilder: (BuildContext context, int index, int realIndex) {
              final int first = index;
              final int second = first + 1;
              print(first);
              print(second);

              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(imageUrl[idx], fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              );
            },

            // [first, second].map((idx) => Expanded(child: Container(
            //   child: Image.network(imageUrl[idx])
            // );)).toList();
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: imageUrl.map(
              (e) {
                return Image.network(
                  e,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                );
              },
            ).toList(),
            options: CarouselOptions(
                enlargeCenterPage: false,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 1)),
          )
        ],
      ),
    );
  }
}
