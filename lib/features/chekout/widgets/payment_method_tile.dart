import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int groupValue;
  final int value;

  final VoidCallback onTap;
  final Color color;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.groupValue,
    required this.onTap,
    required this.color,
    required this.value,
  });
  bool get isSelected => value == groupValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0,0),
              spreadRadius: 5
            )
          ],
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(

          leading: Image.asset(
            imagePath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          title: Text(
            title,
            style: TextStyle(
              color:Colors.white,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color:Colors.white,
            ),
          ),
          trailing: Radio<int>(
            value: value,
            groupValue:groupValue,
            onChanged: (_) => onTap(),
            activeColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
