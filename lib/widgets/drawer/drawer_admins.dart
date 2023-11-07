import 'package:bucher/screens/common/decide/descision_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/common/about/about_screen.dart';
import '../../screens/common/privacy_policy/privacy_policy.dart';
import '../../screens/common/terms_conditions/terms_and_conditions.dart';


// import 'package:shared_preferences/shared_preferences.dart';
class DrawerAdmins extends StatelessWidget {
  const DrawerAdmins({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(87, 27, 43, 149),
      width: MediaQuery.of(context).size.width / 1.7,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const AboutScreen()));
                  },
                  child: const Text(
                    "About",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const TermsAndConditions()));
                  },
                  child: const Text(
                    "Terms and Conditions",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  )),
              // const SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //     onTap: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (ctx) => const GridviewAdmins()));
              //     },
              //     child: const Text(
              //       "ViewAll",
              //       style: TextStyle(color: Colors.amber, fontSize: 20),
              //     )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const PrivacyPolicy()));
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    final shared = await SharedPreferences.getInstance();
                    shared.setBool('LoginState', false);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => const DescisionScreen()),
                        (route) => false);
                  },
                  child: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
