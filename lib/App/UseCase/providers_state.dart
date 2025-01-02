import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Utils/enums.dart';


/// Normal Fetch & Buttons & Professional Fetch
class ProvidersState extends Equatable {

  /// Professional Fetch
  final List<dynamic> data;
  final RequestsState state;
  final String errorMsg;
  final int page;
  final bool hasMore;

  /// Single Fetch
  final dynamic singleData;
  final RequestsState singleState;
  final String singleErrorMsg;


  /// Normal Fetch
  final List<dynamic> normalData;
  final RequestsState normalState;
  final String normalErrorMsg;

  /// Buttons
  final RequestsState buttonState;
  final String buttonErrMsg;

  const ProvidersState({
    /// Professional Fetch
    this.data = const [] ,
    this.state = RequestsState.initial ,
    this.errorMsg = '' ,
    this.page = 1 ,
    this.hasMore = true ,

    /// Single Fetch
    this.singleData ,
    this.singleState = RequestsState.initial ,
    this.singleErrorMsg = '' ,

    /// Normal Fetch
    this.normalData = const [] ,
    this.normalState = RequestsState.initial ,
    this.normalErrorMsg = '' ,

    /// Buttons
    this.buttonState = RequestsState.initial ,
    this.buttonErrMsg = ''
  });

  ProvidersState copyWith({
    /// Professional Fetch
    List<dynamic>? data ,
    RequestsState? state ,
    String? errorMsg ,
    int? page ,
    bool? hasMore ,

    /// Single Fetch
    dynamic singleData ,
    RequestsState? singleState ,
    String? singleErrorMsg ,

    /// Normal Fetch
    List<dynamic>? normalData ,
    RequestsState? normalState ,
    String? normalErrorMsg ,

    /// Buttons
    RequestsState? buttonState ,
    String? buttonErrMsg
  }) {
    return ProvidersState(
      /// Professional Fetch
        data: data ?? this.data ,
        state: state ?? this.state ,
        errorMsg: errorMsg ?? this.errorMsg ,
        page: page ?? this.page ,
        hasMore: hasMore ?? this.hasMore ,


        /// Single Fetch
        singleData: singleData ?? this.singleData ,
        singleState: singleState ?? this.singleState ,
        singleErrorMsg: singleErrorMsg ?? this.singleErrorMsg ,

        /// Normal Fetch
        normalData: normalData ?? this.normalData ,
        normalState: normalState ?? this.normalState ,
        normalErrorMsg: normalErrorMsg ?? this.normalErrorMsg ,

        /// Buttons
        buttonState: buttonState ?? this.buttonState ,
        buttonErrMsg: buttonErrMsg ?? this.buttonErrMsg
    );
  }

  @override
  List<Object?> get props => [
    state , errorMsg , data , page , hasMore ,
    singleData, singleState, singleErrorMsg ,
    normalData, normalState, normalErrorMsg ,
    buttonState , buttonErrMsg
  ];
}

