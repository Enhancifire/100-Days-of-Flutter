import 'package:web_testing/ui/common/app_colors.dart';
import 'package:web_testing/ui/common/app_constants.dart';
import 'package:web_testing/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceLarge,
              Column(
                children: [
                  const Text(
                    'Hello, DESKTOP UI!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpaceMedium,
                  MaterialButton(
                    color: Colors.black,
                    onPressed: viewModel.incrementCounter,
                    child: Text(
                      viewModel.counterLabel,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: kcDarkGreyColor,
                    child: const Text(
                      'Show Dialog',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: viewModel.showDialog,
                  ),
                  MaterialButton(
                    color: kcDarkGreyColor,
                    child: const Text(
                      'Show Bottom Sheet',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: viewModel.showBottomSheet,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
