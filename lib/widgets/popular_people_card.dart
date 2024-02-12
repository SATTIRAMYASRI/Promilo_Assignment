import 'package:flutter/material.dart';
import 'package:promilo_assignment/constants/image_constants.dart';
import 'package:promilo_assignment/constants/space_constants.dart';
import 'package:promilo_assignment/constants/string_constants.dart';

class PopularPeopleCard extends StatelessWidget {
  const PopularPeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        popularPeopleCardTile(),
        HorizontalSpaceConstants.horizontalSpace10,
        popularPeopleCardTile(),
        HorizontalSpaceConstants.horizontalSpace10,
        popularPeopleCardTile(),
      ]),
    );
  }

  Widget popularPeopleCardTile() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo.shade900, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.indigo.shade700, width: 1.5),
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(
                    ImageConstants.featherIcon,
                    fit: BoxFit.cover,
                    color: Colors.indigo.shade700,
                  ),
                ),
                HorizontalSpaceConstants.horizontalSpace15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.author,
                      style: TextStyle(
                          color: Colors.indigo.shade900,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      StringConstants.noOfMeetups,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 0.9,
            ),
            VerticalSpaceConstants.verticalSpace5,
            SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    left: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          ImageConstants.popularPeople1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          ImageConstants.popularPeople2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          ImageConstants.popularPeople3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          ImageConstants.popularPeople4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          ImageConstants.popularPeople5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpaceConstants.verticalSpace10,
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.indigo.shade700),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    StringConstants.seeMore,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
