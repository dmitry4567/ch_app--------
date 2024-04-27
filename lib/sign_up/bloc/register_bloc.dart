import 'package:bloc/bloc.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/main.dart';
import 'package:equatable/equatable.dart';
import '../../flutter_flow/custom_functions.dart' as functions;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<RegisterAuth>((event, emit) async {
      emit(const RegisterInitial());
      ApiCallResponse register = await SignUpCall.call(
        nickname: event.nickname,
        email: event.email,
        telegram: event.telegram,
        password: event.password,
      );

      if (functions.resultCodeSuccess(getJsonField(
        (register.jsonBody ?? ''),
        r'''$.status''',
      ))) {
        ffAppState.userAuthToken =
            getJsonField(register.jsonBody ?? '', r'''$.access_token''');
        emit(const RegisterPass());
      } else {
        emit(RegisterError(
            getJsonField(register.jsonBody ?? '', r'''$.error''').toString()));
      }
    });
  }
}
