import 'package:flutter/material.dart';
import 'package:promilo_assignment/Screens/meet_up_details_screen.dart';
import 'package:promilo_assignment/constants/image_constants.dart';

class MeetupCards extends StatelessWidget {
  const MeetupCards({super.key});
  static List<Map<String, dynamic>> itemList = [
    {
      'image': ImageConstants.popularPeople5,
      'onTap': () {
        print('Tapped on item 1');
      },
    },
    {
      'image': ImageConstants.popularPeople4,
      'onTap': () {
        print('Tapped on item 2');
      },
    },
    {
      'image': ImageConstants.popularPeople3,
      'onTap': () {
        print('Tapped on item 3');
      },
    },
    {
      'image': ImageConstants.popularPeople2,
      'onTap': () {
        print('Tapped on item 4');
      },
    },
    {
      'image': ImageConstants.popularPeople1,
      'onTap': () {
        print('Tapped on item 5');
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: itemList.asMap().entries.map((entry) {
          final String index = (entry.key + 1).toString().padLeft(2, '0');
          final Map<String, dynamic> item = entry.value;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                item['onTap'];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeetupDetailsScreen()),
                );
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          index,
                          style: TextStyle(
                            color: Colors.indigo.shade900,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
