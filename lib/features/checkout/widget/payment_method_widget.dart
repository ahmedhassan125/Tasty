import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';
import '../../orderHistory/data/order_cubit/order_cubit.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    required this.color,
     this.icon,
  });
  final String text;
  final String imagePath;
  final bool isSelected;
  final Color color;
  final Icon? icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Image.asset(imagePath, width: 80),
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  style: Styles.boldTextStyle16.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
             // const Spacer(),
             icon?? Icon(isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: Colors.white,
              ),
             // TextButton(onPressed: (){}, child: Text('Edite'))
            ],
          ),
        ),
      ),
    );
  }
}
