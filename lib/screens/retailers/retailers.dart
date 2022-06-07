import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/index_toggled.dart';
import 'package:mobilefirst/blocs/toggle_index_bloc.dart';
import 'package:mobilefirst/blocs/user/user_bloc.dart';
import 'package:mobilefirst/models/user/retailer_model.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';

class Retailers extends StatelessWidget {
  const Retailers({
    Key? key,
    required this.retailers,
    required this.userBloc,
  }) : super(key: key);
  final List<RetailerModel> retailers;
  final UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: retailers.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              PreferenceUtils.putString(seletedRetailer, retailers[index].id!);
              PreferenceUtils.putString(retailerName, retailers[index].name!);
              Navigator.of(context).pushReplacementNamed(orderRoute);
              userBloc
                  .add(SelectRetailer(retailerName: retailers[index].name!));
            },
            tileColor: secondaryLight,
            title: Text(
              retailers[index].name!,
              style: kLabelStyleBold,
            ),
            subtitle: Text(retailers[index].address!),
            trailing: Column(
              children: [
                Text(retailers[index].email!),
                Text(retailers[index].phone!),
              ],
            ),
          );
        });
  }
}
