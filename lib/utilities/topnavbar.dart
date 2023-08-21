import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/assetsImage.dart';
import '../constants/themeDark.dart';
import 'cateoriser.dart';

class TopNavigationBar extends ConsumerWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      width: 174.07,
      height: 25,
      child: Row(
        children: [
            Categoriser(
                            index: 0,
                            colors: const [
                              Color.fromARGB(255, 80, 22, 191),
                              Color.fromARGB(255, 120, 29, 193),
                              Color.fromARGB(255, 154, 32, 187),
                              Color.fromARGB(255, 201, 39, 168),
                              Color.fromARGB(255, 186, 24, 112),
                            ],
                            whiteImage: AssetImages.whitePen,
                            shadowColor: Color.fromARGB(255, 237, 76, 221),
                            darkImage: AssetImages.pen,
                            onTap: () {
                              ref.read(selectedCategoriserIndexProvider.notifier).update((state) => 0);
                            }),
                        SizedBox(
                          width: 10,
                        ),
                          Categoriser(
                            index: 1,
                            colors: [
                              Color.fromARGB(255, 193, 223, 253),
                              const Color.fromARGB(255, 77, 166, 255),
                              Color.fromARGB(255, 59, 95, 255),
                              Color.fromARGB(255, 82, 59, 255)
                            ],
                            whiteImage: AssetImages.whiteunion,
                            darkImage: AssetImages.union,
                            shadowColor: DarkTheme.skBlue,
                            onTap: () {
                              ref.read(selectedCategoriserIndexProvider.notifier).update((state) => 1);
                            }),
                              SizedBox(
                          width: 10,
                        ),
                        Categoriser(
                            index: 2,
                            colors: [
                              Color.fromARGB(255, 253, 247, 193),
                              DarkTheme.yelCol,
                              Color.fromARGB(255, 255, 206, 59),
                              const Color.fromARGB(255, 255, 186, 59)
                            ],
                            whiteImage: AssetImages.whiteStar,
                            darkImage: AssetImages.star,
                            shadowColor: DarkTheme.yelCol,
                            onTap: () {
                              ref.read(selectedCategoriserIndexProvider.notifier).update((state) => 2);
                            }),
                            
                           
        ],
      ),
    );
  }
}