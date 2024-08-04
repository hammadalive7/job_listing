import 'package:flutter/material.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                        child: Text(job.company,
                            style: const TextStyle(
                                color: Color(0xff5ca5a4),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      if (job.isNew)
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            label: Text('NEW!',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Color(0xff5ca5a4),
                          ),
                        ),
                      if (job.isFeatured)
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            label: Text('FEATURED',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.black87,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Text(job.position,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Text(
                      '${job.postedAt}  •  ${job.contract}  •  ${job.location}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Divider(color: Colors.grey[300], thickness: 1.0),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      ...job.languages
                          .map((lang) => ActionChip(
                                backgroundColor: const Color(0xfff0fafa),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                side:
                                    const BorderSide(color: Color(0xfff0fafa)),
                                label: Text(lang,
                                    style: const TextStyle(
                                        color: Color(0xff5ca5a4))),
                                onPressed: () => onAddFilter(lang),
                              ))
                          .toList(),
                      ...job.tools
                          .map((tool) => ActionChip(
                                backgroundColor: const Color(0xfff0fafa),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                side:
                                    const BorderSide(color: Color(0xfff0fafa)),
                                label: Text(tool,
                                    style: const TextStyle(
                                        color: Color(0xff5ca5a4))),
                                onPressed: () => onAddFilter(tool),
                              ))
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 40),
          child: Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: 60.0,
              child: SvgPicture.asset(job.logo),
            ),
          ),
        ),
      ],
    );
  }
}
