

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mynote/navigation/router.dart';
import 'package:mynote/views/Screens/add_note.dart';
import 'package:mynote/views/Screens/faverot_Screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Home_Screen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override


  @override
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff3930d8),
        flexibleSpace: Stack(
          children: [

            Row(
              mainAxisAlignment: (context.locale.toString()=='en')
                  ?MainAxisAlignment.start
                  :MainAxisAlignment.end,
              children: [
                Image.asset("assets/image/Scroll Group 1.png",height: 106.h,),
              ],
            ),
            Row(
              mainAxisAlignment: (context.locale.toString()=='en')
                  ?MainAxisAlignment.end
                  :MainAxisAlignment.start,
              children: [
                Image.asset("assets/image/Scroll Group 2.png",height: 75.h,)
              ],
            ),
            Padding(
              padding:(context.locale.toString()=='en')
                  ? const EdgeInsets.only(left: 18, top: 30, )
                  :const EdgeInsets.only(right: 18, top: 30, ),
              child: Row(
                children: [
                  SizedBox(
                    width: 239.w,
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: EdgeInsets.all(1.h),
                        hintText:"Search Your Notes".tr(),

                        prefixIcon: Icon(Icons.search,color: Colors.black54,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.black12),
                        ),


                      ),

                    ),
                  ),
                  SizedBox(width: 66.w,),
                  InkWell(
                    onTap: () async {
                      if(await context.locale.toString()=="ar"){
                        await context.setLocale(Locale('en'));
                      }else{
                        await context.setLocale(Locale('ar'));
                      }
                      // AppRouter.NavigateWithReplacemtnToWidget(MainScreen());

                    },
                    child: Icon(Icons.language),
                  )


                ],
              ),
            )
          ],
        ),
        toolbarHeight: 75.h,
      ),


      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          HomeScreen(),
          AddNoteScreen(),
          FaverotScreen()
        ],
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
}



List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home".tr()),
      activeColorPrimary: Color(0xff3930D8),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.add,color: Colors.white,),
      activeColorPrimary: CupertinoColors.activeOrange,
      inactiveColorPrimary: CupertinoColors.activeGreen,
      onPressed: (x){
        AppRouter.NavigateWithReplacemtnToWidget(AddNoteScreen());
      }

    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.heart),
      title: ("faverot".tr()),
      activeColorPrimary: Color(0xff3930D8),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

  ];
}
