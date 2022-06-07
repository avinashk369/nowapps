import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/index_toggled.dart';
import 'package:mobilefirst/blocs/toggle_index_bloc.dart';
import 'package:mobilefirst/blocs/user/userbloc.dart';
import 'package:mobilefirst/repository/user/user_repositoryimpl.dart';
import 'package:mobilefirst/screens/retailers/retailers.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';

import 'package:mobilefirst/widgets/loading_ui.dart';

class RetailerList extends StatelessWidget {
  const RetailerList({
    Key? key,
    required this.userBloc,
  }) : super(key: key);
  final UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (context) => UserBloc(context.read<UserRepositoryImpl>())
              ..add(const LoadRetailers())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Retailers"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is RetailersLoaded) {
              return Retailers(
                retailers: state.retailers,
                userBloc: userBloc,
              );
            }
            if (state is UserInitializing) {
              return const LoadingUI();
            }
            if (state is UserError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  state.message,
                  style: kLabelStyleBold.copyWith(color: redColor),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
