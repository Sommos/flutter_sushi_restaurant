import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/filter.dart';

class FilterTile extends StatelessWidget {
  final Filter filter;
  final void Function()? onTap;

  const FilterTile({
    super.key,
    required this.filter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.only(left: 20.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              filter.imagePath,
              height: 30.0,
              width: 30.0,
            ),

            const SizedBox(width: 15.0),

            // text
            Text(
              filter.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}