import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'job_card_text.dart';
import 'job_carf_chips.dart';

class JobCard extends StatelessWidget {
  final Jobs job;
  final Function(String) onAddFilter;

  const JobCard({
    super.key,
    required this.job,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5ca5a4).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border(
                  left: BorderSide(
                    style: BorderStyle.solid,
                    color: job.isFeatured
                        ? const Color(0xff5ca5a4)
                        : Colors.white, // Blue color
                    width: 3.0, // Thickness
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: constraints.maxWidth > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 60.0,
                                    child: SvgPicture.asset(job.logo)),
                                SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.03),
                                JobCardText(job: job),
                              ],
                            ),
                            JobCardChips(job: job, onAddFilter: onAddFilter),
                          ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          JobCardText(job: job),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01),
                          Divider(color: Colors.grey[300], thickness: 1.0),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01),
                          JobCardChips(job: job, onAddFilter: onAddFilter),
                        ],
                      ),
              ),
            ),
          ),
          constraints.maxWidth > 800
              ? Container()
              : Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 40),
                    child: SizedBox(
                      width: 60.0,
                      child: SvgPicture.asset(job.logo),
                    ),
                  ),
                ),
        ],
      );
    });
  }
}
