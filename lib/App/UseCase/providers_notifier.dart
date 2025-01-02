import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_todo/App/Error/failures.dart';

class ProvidersNotifier {

  Future<Response?> fetch({
    required Future<({Failures? failures, Response<dynamic>? value})> value ,
    required ScrollController? scrollController ,
    required Function() cache ,
    required Function() error ,
    required Function(String msg) errMsg ,
    required Future<void> Function(Response<dynamic> value) success ,
    required Future<void> Function(Response<dynamic> value) infinity
  }) async {

    ({Failures? failures, Response<dynamic>? value}) result = await value;
    final List<dynamic>? data = result.value?.data;


    if(result.value != null ) {
      await success(result.value!);

      if(scrollController != null) {
        scrollController.addListener(() async {
          await infinity(result.value!);
        });
      }



    } else {

      await errMsg(result.value!.statusMessage!);

      if(data == null) {
        cache();
      } else {
        error();
      }
    }

    return result.value;
  }

}