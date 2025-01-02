import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_todo/App/Error/failures.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/App/Utils/enums.dart';
import 'package:task_todo/Features/Domain/Entities/home_entities.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';

class HomeNotifier extends StateNotifier<ProvidersState> {

  HomeUseCases? _homeUseCases;
  DetailsHomeUseCases? _detailsHomeUseCases;
  DeleteHomeUseCases? _deleteHomeUseCases;
  UploadUseCases? _uploadUseCases;

  HomeNotifier({
    HomeUseCases? homeUseCases ,
    DetailsHomeUseCases? detailsHomeUseCases ,
    DeleteHomeUseCases? deleteHomeUseCases ,
    UploadUseCases? uploadUseCases ,
  }) : super(const ProvidersState()) {
    _homeUseCases = homeUseCases;
    _detailsHomeUseCases = detailsHomeUseCases;
    _deleteHomeUseCases = deleteHomeUseCases;
    _uploadUseCases = uploadUseCases;
  }

  Future<void> loadMoreDataHome({
    required ScrollController scrollController,
    required String? status ,
  }) async {
    if(!state.hasMore) return;

    if(scrollController.position.maxScrollExtent == scrollController.offset) {
      ({Failures? failures, Response<dynamic>? value}) result = await _homeUseCases!.call(HomeParameters(
        page: state.page + 1 ,
        status: status
      ));

      if(result.value?.data == null) return;
      final List<dynamic> data = await result.value?.data;


      state = state.copyWith(
          state: RequestsState.success ,
          data: List.of(state.data)..addAll(data) ,
          page: state.page + 1 ,
          hasMore: data.length <= 2 ? false : true
      );

    }

  }


  Future<Response?> fetchHome({
    ScrollController? scrollController ,
    required String? status
  }) async {
    state = state.copyWith(
        state: RequestsState.loading ,
        data: List.of(state.data)..clear() ,
        page: 1
    );


    ({Failures? failures, Response<dynamic>? value}) result = await _homeUseCases!.call(HomeParameters(
        page: state.page ,
        status: status
    ));

    final List<dynamic>? data = await result.value!.data;



    if(result.value != null) {

      if(result.value?.statusCode == 401) {

        await _homeUseCases!.call(HomeParameters(
            page: state.page ,
            status: status
        ));
      }

      state = state.copyWith(
          page: state.page ,
          data: List.of(state.data)..addAll(data!) ,
          state: RequestsState.success ,
          hasMore: true
      );

      if(scrollController != null) {
        scrollController.addListener(() async {
          await loadMoreDataHome(scrollController: scrollController, status: status);
        });
      }



    } else {
      if(data == null) {

        state = state.copyWith(
            state: RequestsState.local ,
            errorMsg: result.failures!.msg
        );
      } else {
        state = state.copyWith(
            state: RequestsState.failure ,
            errorMsg: result.failures!.msg
        );
      }
    }

    return result.value;
  }


  Future<HomeEntities?> detailsHome(DetailsHomeParameters params) async {

    state = state.copyWith(singleState: RequestsState.loading);

    ({Failures? failures, HomeEntities? value}) result = await _detailsHomeUseCases!.call(params);

    if(result.failures == null ) {

      state = state.copyWith(
        singleData: result.value ,
        singleState: RequestsState.success ,
      );


    } else {
      if(result.failures!.local) {
        state = state.copyWith(
            singleState: RequestsState.local ,
            singleErrorMsg: result.failures?.msg
        );
      } else {
        state = state.copyWith(
            singleState: RequestsState.failure ,
            singleErrorMsg: result.failures?.msg
        );
      }
    }
    return result.value;

  }


  Future<Response?> delete(DeleteHomeParameters params) async {

    state = state.copyWith(buttonState: RequestsState.loading);

    final ({Failures? failures, Response<dynamic>? value}) result = await _deleteHomeUseCases!.call(params);
    if(result.value != null) {

      state = state.copyWith(buttonState: RequestsState.success);

    } else {
      if(result.failures!.local == true) {

        state = state.copyWith(
            buttonState: RequestsState.local ,
            buttonErrMsg: result.failures!.msg
        );

      } else {

        state = state.copyWith(
            buttonState: RequestsState.failure ,
            buttonErrMsg: result.failures!.msg
        );

      }
    }
    return result.value;
  }


  Future<Response?> upload(UploadParameters params) async {

    state = state.copyWith(buttonState: RequestsState.loading);

    final ({Failures? failures, Response<dynamic>? value}) result = await _uploadUseCases!.call(params);
    if(result.value != null) {

      state = state.copyWith(buttonState: RequestsState.success);

    } else {
      if(result.failures!.local == true) {

        state = state.copyWith(
            buttonState: RequestsState.local ,
            buttonErrMsg: result.failures!.msg
        );

      } else {

        state = state.copyWith(
            buttonState: RequestsState.failure ,
            buttonErrMsg: result.failures!.msg
        );

      }
    }
    return result.value;
  }



  ProvidersState removeItem(int index) {
    return state = state.copyWith(
        data: List.from(state.data)..removeAt(index)
    );
  }


}