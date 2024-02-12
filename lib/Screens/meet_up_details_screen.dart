import 'package:flutter/material.dart';
import 'package:promilo_assignment/constants/space_constants.dart';
import 'package:promilo_assignment/constants/string_constants.dart';
import 'package:promilo_assignment/widgets/details_screen_carousel.dart';
import 'package:share_plus/share_plus.dart';

class MeetupDetailsScreen extends StatelessWidget {
  const MeetupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios, color: Colors.indigo.shade900),
        title: Text(
          StringConstants.description,
          style: TextStyle(color: Colors.indigo.shade900, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const meetupDetailsScreenCarousel(),
                VerticalSpaceConstants.verticalSpace10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.file_download,
                      size: 26,
                      color: Colors.grey.shade700,
                    ),
                    Icon(
                      Icons.bookmark_border,
                      size: 26,
                      color: Colors.grey.shade700,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 26,
                      color: Colors.grey.shade700,
                    ),
                    Icon(
                      Icons.screenshot,
                      size: 26,
                      color: Colors.grey.shade900,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 26,
                      color: Colors.grey.shade900,
                    ),
                    InkWell(
                      onTap: () async {
                        await Share.share('Check out this awesome app!');
                      },
                      child: Icon(
                        Icons.share,
                        size: 26,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                )
              ]),
            ),
            VerticalSpaceConstants.verticalSpace5,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.bookmark_border,
                  size: 20,
                  color: Colors.blue.shade700,
                ),
                Text(
                  "1034",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                HorizontalSpaceConstants.horizontalSpace10,
                Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Colors.blue.shade700,
                ),
                Text(
                  "1034",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                HorizontalSpaceConstants.horizontalSpace15,
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.blue.shade400,
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.blue.shade400,
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.blue.shade400,
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.blue.shade200,
                        ),
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    )),
                HorizontalSpaceConstants.horizontalSpace15,
                Text(
                  "3.2",
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            VerticalSpaceConstants.verticalSpace15,
            Text(
              StringConstants.actorName,
              style: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              StringConstants.indianActress,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            VerticalSpaceConstants.verticalSpace10,
            const Row(
              children: [
                Icon(
                  Icons.punch_clock,
                  size: 24,
                  color: Colors.grey,
                ),
                HorizontalSpaceConstants.horizontalSpace10,
                Text(
                  StringConstants.duration,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            VerticalSpaceConstants.verticalSpace10,
            const Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 24,
                  color: Colors.grey,
                ),
                HorizontalSpaceConstants.horizontalSpace10,
                Text(
                  StringConstants.fee,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            VerticalSpaceConstants.verticalSpace10,
            Text(
              StringConstants.about,
              style: TextStyle(
                  color: Colors.indigo.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            VerticalSpaceConstants.verticalSpace10,
            const Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              StringConstants.placeDescription,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            VerticalSpaceConstants.verticalSpace10,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                StringConstants.seeMore,
                style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
