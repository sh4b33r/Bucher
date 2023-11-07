import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function? onTitleTapped;

  // const CustomAppbar({Key? key, required this.title}) : super(key: key);
  @override
  final Size preferredSize;
  const CustomAppbar(
      {super.key, required this.title,
      required this.child,
      required this.onPressed,
      this.onTitleTapped})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'topBarBtn',
                child: MaterialButton(
                  height: 50,
                  minWidth: 40,
                  elevation: 10,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: child,
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: false,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20)),
                      color: Color.fromARGB(255, 16, 31, 75)),
                  // color: Color.fromARGB(255, 16, 31, 75),

                  child: SizedBox(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width / 1.20,
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            // color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);
Widget menuBtton = const InkWell(
    child: Icon(
  Icons.menu,
  size: 20,
));

// ==============================================================================
@override
Size get preferredSize => const Size.fromHeight(60.0);
