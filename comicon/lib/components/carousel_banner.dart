import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  InfiniteScrollController controller = InfiniteScrollController();
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List<String> banners = [
    'assets/images/carousel/Carousel 1.png',
    'assets/images/carousel/Carousel 2.png',
    'assets/images/carousel/Carousel 3.png',
    'assets/images/carousel/Carousel 4.png',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1668939739970-0e5771873b55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1465&q=80"))),
      child: InfiniteCarousel.builder(
          itemCount: banners.length,
          itemExtent: width / 2,
          axisDirection: Axis.horizontal,
          center: true,
          itemBuilder: (context, itemIndex, realIndex) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 400,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    banners[itemIndex],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
