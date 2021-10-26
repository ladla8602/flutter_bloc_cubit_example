import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/screens/home/cubit/home_cubit.dart';

import 'user_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.dehaze),
          onPressed: () => debugPrint("This is drawer menu icon"),
        ),
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          "Flutter - Bloc/Cubit Example App",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: BlocProvider(
        create: (_) => HomeCubit()..fetchUsers(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.failure:
                return const Center(child: Text('failed to fetch topics'));
              case HomeStatus.success:
                // if (state.topics.isEmpty) {
                //   return const Center(child: Text('no users'));
                // }
                return _buildUserList(state);
              default:
                return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserList(HomeState state) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return UserListItemWidget(user: state.users[index]);
      },
      itemCount: state.users.length,
    );
  }
}
