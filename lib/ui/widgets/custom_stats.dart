import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';

class CustomStats extends StatelessWidget {
  final String text;
  final String total;
  final IconData iconData;
  final Color color;

  const CustomStats({
    Key? key,
    required this.text,
    required this.total,
    required this.iconData,
    this.color = kcPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 150,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    SelectableText(
                      text,
                      style: ktMediumTextStyle.copyWith(
                        color: kcPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SelectableText(
                      total,
                      style: ktBoldTextStyle.copyWith(
                        fontSize: 32,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
