import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';

class ToppingItemWidget extends StatelessWidget {
  const ToppingItemWidget({
    super.key,
    required this.index,
    required this.name,
    required this.image,
     this.addOption,
    required this.isSelected,
  });
  final int index;
  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback? addOption;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: addOption,
      child: LayoutBuilder(builder: (context, constraints) {
        constraints.maxHeight;
        return  Column(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth* 0.285,
                  height: screenHeight * 0.155,
                  decoration: BoxDecoration(
                    color: Color(0xff3C2F2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,

                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: isSelected
                                ? Colors.green
                                : Colors.red,
                            radius: 14,
                            child: isSelected
                                ? Icon(Icons.check, color: Colors.white, size: 14)
                                : Icon(Icons.add, color: Colors.white, size: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth* 0.285,
                  height: screenHeight * 0.103,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 40),
                    placeholder: (context, url) =>
                        CustomCupertinoIndicator(width: 110),
                    imageUrl: image,
                  ),
                ),
              ],
            ),
          ],
        );
      },)

    );
  }
}
