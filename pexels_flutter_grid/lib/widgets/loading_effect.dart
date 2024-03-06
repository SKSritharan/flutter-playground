import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 120,
              height: 80,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
