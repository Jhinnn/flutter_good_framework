import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/constants.dart';
import 'package:good_framework/z_provider/base_index.dart';
import 'package:provider/provider.dart';

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int mainIndex = context
        .select((IndexProvider indexProvider) => indexProvider.mainIndex);
    return Scaffold(
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView.builder(
              itemCount: AppStrings.catalogueList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      context.read<IndexProvider>().setMainIndex(index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.catalogueList[index],
                        style: TextStyle(
                            fontSize: mainIndex == index ? 16 : 14,
                            color: mainIndex == index
                              ? AppColors.emphasizeColor
                                : Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
