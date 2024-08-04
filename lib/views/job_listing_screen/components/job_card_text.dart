import 'package:flutter/material.dart';
import 'package:flutter_listing/model/listing_model.dart';

class JobCardText extends StatelessWidget {
  final Jobs job;

  const JobCardText({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      side: BorderSide(color: Color(0xff5ca5a4)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  label: Text('NEW!', style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5ca5a4),
                ),
              ),
            if (job.isFeatured)
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Chip(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  label:
                      Text('FEATURED', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.black87,
                ),
              ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Text(job.position,
            style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Text('${job.postedAt}  •  ${job.contract}  •  ${job.location}',
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
