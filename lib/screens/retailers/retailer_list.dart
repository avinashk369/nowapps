import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/index_toggled.dart';
import 'package:mobilefirst/blocs/toggle_index_bloc.dart';
import 'package:mobilefirst/models/user/retailer_model.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/preference_utils.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';

class RetailerList extends StatelessWidget {
  const RetailerList({
    Key? key,
    required this.retailers,
    required this.onTap,
  }) : super(key: key);
  final List<RetailerModel> retailers;
  final Function(RetailerModel retailer) onTap;

  @override
  Widget build(BuildContext context) {
    String retailerId = PreferenceUtils.getString(seletedRetailer);
    return BlocBuilder<ToggleIndexBloc, IndexToggled>(
        builder: (context, state) {
      return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: retailers.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                onTap(retailers[index]);
                retailerId = retailers[index].id!;
                context.read<ToggleIndexBloc>().toggleState(index, false);
              },
              tileColor: (state.isSelected && state.index == index) ||
                      retailers[index].id == retailerId
                  ? Colors.grey[200]
                  : secondaryLight,
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
    });
  }
}
