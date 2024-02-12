import 'package:flutter/material.dart';
import 'package:promilo_assignment/constants/space_constants.dart';
import 'package:promilo_assignment/constants/string_constants.dart';
import 'package:promilo_assignment/widgets/meetup_cards.dart';
import 'package:promilo_assignment/widgets/meetup_carousel.dart';
import 'package:promilo_assignment/widgets/popular_people_card.dart';

class MeetUpScreen extends StatefulWidget {
  const MeetUpScreen({super.key});

  @override
  State<MeetUpScreen> createState() => _MeetUpScreenState();
}

class _MeetUpScreenState extends State<MeetUpScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: StringConstants.search,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.indigo.shade900, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.indigo.shade900, width: 1.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.indigo.shade900,
                  size: 30,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Colors.indigo.shade900,
                  size: 30,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
            ),
            VerticalSpaceConstants.verticalSpace15,
            const meetupScreenCarousel(),
            VerticalSpaceConstants.verticalSpace15,
            Text(
              StringConstants.trendingPopularPeople,
              style: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            VerticalSpaceConstants.verticalSpace10,
            const PopularPeopleCard(),
            VerticalSpaceConstants.verticalSpace10,
            Text(
              StringConstants.topTrendingMeetups,
              style: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            VerticalSpaceConstants.verticalSpace10,
            const MeetupCards(),
          ],
        ),
      ),
    );
  }
}
