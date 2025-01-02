import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_todo/App/UseCase/providers_state.dart';
import 'package:task_todo/Features/Data/DataSource/home_data_source.dart';
import 'package:task_todo/Features/Data/Repository/home_repository.dart';
import 'package:task_todo/Features/Domain/Repository/base_home_repository.dart';
import 'package:task_todo/Features/Domain/UseCases/delete_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/details_home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/home_use_case.dart';
import 'package:task_todo/Features/Domain/UseCases/upload_use_case.dart';
import 'package:task_todo/Features/Presentation/Controller/Home/home_notifier.dart';

final _dataSource = Provider
    .family<BaseHomeDataSource,FlutterSecureStorage>((ref,storage) {
  return HomeDataSource(secureStorage: storage);
});


final _repository = Provider
    .family<BaseHomeRepository,FlutterSecureStorage>((ref,storage) {
  return HomeRepository(ref.read(_dataSource(storage)));
});



final _homeUseCase = Provider
    .family<HomeUseCases,FlutterSecureStorage>((ref,storage) {
  return HomeUseCases(ref.read(_repository(storage)));
});


final _detailsUseCase = Provider
    .family<DetailsHomeUseCases,FlutterSecureStorage>((ref,storage) {
  return DetailsHomeUseCases(ref.read(_repository(storage)));
});


final _deleteUseCase = Provider
    .family<DeleteHomeUseCases,FlutterSecureStorage>((ref,storage) {
  return DeleteHomeUseCases(ref.read(_repository(storage)));
});

final _uploadUseCase = Provider
    .family<UploadUseCases,FlutterSecureStorage>((ref,storage) {
  return UploadUseCases(ref.read(_repository(storage)));
});



final homeNotifier = StateNotifierProvider
    .family<HomeNotifier , ProvidersState, FlutterSecureStorage>((ref,storage) {
  return HomeNotifier(homeUseCases: ref.read(_homeUseCase(storage)));
});



final detailsHomeNotifier = StateNotifierProvider
    .family<HomeNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return HomeNotifier(detailsHomeUseCases: ref.read(_detailsUseCase(storage)));
});


final uploadNotifier = StateNotifierProvider
    .family<HomeNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return HomeNotifier(uploadUseCases: ref.read(_uploadUseCase(storage)));
});

final deleteNotifier = StateNotifierProvider
    .family<HomeNotifier , ProvidersState, FlutterSecureStorage>((ref, storage) {
  return HomeNotifier(deleteHomeUseCases: ref.read(_deleteUseCase(storage)));
});


