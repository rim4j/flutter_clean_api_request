import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          borderRadius: BorderRadius.circular(20),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(subTitle),
        tileColor: Colors.grey[200],
      ),
    );
  }
}
