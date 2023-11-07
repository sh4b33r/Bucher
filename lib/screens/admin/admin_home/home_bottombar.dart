// import 'package:bucher/screens/___Admin/A_Home/home_admins.dart';
// import 'package:bucher/screens/___Admin/Add/add_screen.dart';
// import 'package:circle_nav_bar/circle_nav_bar.dart';
// import 'package:flutter/material.dart';

// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({super.key});

//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }

// class _CustomBottomBarState extends State<CustomBottomBar> {
//   int selected=1;
//   var pages=[
//     AddScreen(),
//     AdminHome(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return CircleNavBar(
      
//       activeIndex: selected,
//       activeIcons: const [
//         Icon(Icons.add, color: Color.fromARGB(255, 2, 32, 117)),
//         Icon(Icons.home, color:Color.fromARGB(255, 2, 32, 117)),
//         Icon(Icons.grid_view_rounded, color: Color.fromARGB(255, 2, 32, 117)),
//       ],
//       inactiveIcons: const [
//           Icon(Icons.add, color: Color.fromARGB(255, 2, 32, 117)),
//          Icon(Icons.home, color:Color.fromARGB(255, 2, 32, 117)),
//          Icon(Icons.grid_view_rounded, color: Color.fromARGB(255, 2, 32, 117)),
//         // Text("Add",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500
//         // )),
//         // Text("Home",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500)),
//         // Text("View All",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500),),
//       ],
//       color: Color.fromARGB(255, 255, 255, 255),
//       // circleColor: Colors.white,
//       height: 60,
//       circleWidth: 60,
      
//       onTap: (index) {
//         setState(() {
//           print(index);
//           selected=index;
//         });
//   //       setState(() {
//   //   // Update the state or navigate to a different page based on the selected tab index
//   //   if (index == 0) {
//   //   // Handle the "My" tab
//   //   } else if (index == 1) {
//   //   // Handle the "Home" tab
//   //   } else if (index == 2) {
//   //   // Handle the "Like" tab
//   //   }
//   // });
//       }, // Change this to the initial index you want
     
//       tabCurve: Curves.linear, // Add a curve here, e.g., Curves.easeInOut
//       padding: const EdgeInsets.only( left: 2,right:2 ,bottom: 0),
//       cornerRadius: const BorderRadius.only(
//         topLeft: Radius.circular(22),
//         topRight: Radius.circular(22),
//         bottomRight: Radius.circular(0),
//         bottomLeft: Radius.circular(0),
//       ),
//       // shadowColor: Color.fromARGB(255, 66, 113, 231),
//       // circleShadowColor: Colors.deepPurple,
//       elevation: 1,
//       // gradient: LinearGradient(
//       //   begin: Alignment.topRight,
//       //   end: Alignment.bottomLeft,
//       //   colors: [Colors.blue, Colors.red],
//       // ),
//       // circleGradient: LinearGradient(
//       //   begin: Alignment.topRight,
//       //   end: Alignment.bottomLeft,
//       //   colors: [Colors.blue, Colors.red],
//       // ),
//       circleGradient: LinearGradient(colors: [Color.fromRGBO(255, 255, 255, 1) ,Color.fromRGBO(255, 255, 255, 1)] ),
//       gradient:RadialGradient(colors: [Color.fromARGB(255, 108, 204, 221) ,Color.fromARGB(255, 108, 204, 221)])  

//     );
//   }
// }