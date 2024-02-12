import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:promilo_assignment/constants/space_constants.dart';

class meetupScreenCarousel extends StatefulWidget {
  const meetupScreenCarousel({
    super.key,
    this.items = const [
      'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
    ],
  });

  final List<String> items;

  @override
  State<meetupScreenCarousel> createState() =>
      _meetupScreenCarouselState();
}

class _meetupScreenCarouselState
    extends State<meetupScreenCarousel> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          items: widget.items
              .map(
                (item) => Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 300,
                ),
              )
              .toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        VerticalSpaceConstants.verticalSpace10,
        DotsIndicator(
          dotsCount: widget.items.length,
          position: currentIndex,
          onTap: (index) {
            controller.animateToPage(index);
          },
          decorator: DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.black,
            size: const Size.square(12.0),
            activeSize: const Size(20.0, 12.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }
}
