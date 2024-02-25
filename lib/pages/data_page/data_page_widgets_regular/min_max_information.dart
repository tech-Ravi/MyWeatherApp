import 'package:flutter/material.dart';

class MinMaxInformation extends StatelessWidget {
  const MinMaxInformation({
    super.key,
    required this.minMax,
  });

  final String minMax;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Min & Max: $minMax ",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
