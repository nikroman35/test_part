import 'package:flutter/cupertino.dart';
import '../resources/text_styles.dart';

class TagView extends StatelessWidget {
  final String data;
  final int id;

  const TagView(this.data, this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(colors: [Color.fromRGBO(100, 100, 80, 1), Color.fromRGBO(224, 200, 30, 1)]),
      ),
      child: Text(
        data,
        style: AppTextStyles.bodySmallMedium(),
      ),
    );
  }
}
