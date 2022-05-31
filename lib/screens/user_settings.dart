library user_settings;

import 'package:flutter/material.dart';
import 'package:mobilefirst/widgets/custom_appbar.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/preference_utils.dart';
import 'package:mobilefirst/utils/theme_constants.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                listTileCard(
                  'Profile',
                  () async {},
                  const Icon(
                    Icons.person,
                  ),
                ),
                listTileCard(
                  'Help',
                  () async {},
                  const Icon(
                    Icons.help,
                  ),
                ),
                listTileCard(
                  'Log out',
                  () async {
                    await PreferenceUtils.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homeRoute, (Route<dynamic> route) => false);
                  },
                  const Icon(
                    Icons.exit_to_app,
                    color: redColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTileCard(String title, Function() onTap, Widget child) => InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: Colors.grey[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: child,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: kLabelStyleBold.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
}
