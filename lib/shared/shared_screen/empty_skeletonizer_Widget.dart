import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EmptySkeletonizerWidget extends StatelessWidget {
  const EmptySkeletonizerWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;

    return Container(
      color: Colors.white,
      height: height,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1.52,
                  child:
                  ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      child: Image(image: AssetImage('assets/images/splash.png')))
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This text is for testing  only.'),
                Text('This text is for testing  only.'),

              ],),
          ),
        ],
      ),
    );

  }
}
