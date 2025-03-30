import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppNavigationWrapper extends StatelessWidget {
  const AppNavigationWrapper({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
  });

  final Widget child;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontFamily: 'Manrope',
      fontSize: 8,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 10.93 / 8,
      letterSpacing: 0,
    );
    return Scaffold(
      backgroundColor: context.colors.white,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.colors.white,
        unselectedItemColor: context.colors.gray500,
        unselectedLabelStyle: textStyle.copyWith(
          color: context.colors.gray500,
          fontWeight: FontWeight.w400,
        ),
        selectedItemColor: context.colors.buttonColor,
        selectedLabelStyle: textStyle.copyWith(
          color: context.colors.buttonColor,
          fontWeight: FontWeight.w700,
        ),
        onTap: (value) {
          onTap(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_rounded,
              size: 32,
              color: currentIndex == 0 ? context.colors.buttonColor : context.colors.gray500,
            ),
            label: '',
            // icon: SvgPicture.asset(
            //   context.assetImages.home,
            //   colorFilter: ColorFilter.mode(
            //     currentIndex == 0 ? context.colors.brand400 : context.colors.gray500,
            //     BlendMode.srcIn,
            //   ),
            // ),
            // label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: 32,
              color: currentIndex == 1 ? context.colors.buttonColor : context.colors.gray500,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restore,
              size: 32,
              color: currentIndex == 2 ? context.colors.buttonColor : context.colors.gray500,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 32,
              color: currentIndex == 3 ? context.colors.buttonColor : context.colors.gray500,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
