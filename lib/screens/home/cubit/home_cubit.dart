import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/repository/api_services.dart';
import 'package:flutter_bloc_pattern/screens/home/models/m_users.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState._());

  Future<void> fetchUsers([int page = 1]) async {
    try {
      final response = await getUsers(page);
      final res = json.decode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        List<User> result = res['data'].map<User>((p) => User.fromJson(p)).toList();
        emit(HomeState.success(status: HomeStatus.success, users: result));
      } else {
        emit(const HomeState.failure());
      }
    } on Exception {
      emit(const HomeState.failure());
    }
  }
}
