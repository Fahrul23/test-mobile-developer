import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_numbers_event.dart';
part 'count_numbers_state.dart';
part 'count_numbers_bloc.freezed.dart';

class CountNumbersBloc extends Bloc<CountNumbersEvent, CountNumbersState> {
  CountNumbersBloc() : super(const _Initial()) {
    on<_CountFirst>((event, emit) {
      final List<int> result = List.generate(event.input, (index) => index + 1);
      emit(_Loaded(result));
    });
    on<_CountSecound>((event, emit) {
      final List<int> result = List.generate(event.input, (index) => index + 1);
      emit(_Loaded([...result, ...result.reversed.skip(1)]));
    });
    on<_CountThird>((event, emit) {
      final List<int> result = List.generate(
        event.input,
        (index) => (index + 1) * 10 + index,
      );
      emit(_Loaded(result));
    });
    on<_CountFourth>((event, emit) {
      final List<String> result = List.generate(event.input, (index) {
        if ((index + 1) % 5 == 0) {
          return 'LIMA';
        } else if ((index + 1) % 7 == 0) {
          return 'TUJUH';
        } else {
          return (index + 1).toString();
        }
      });
      emit(_LoadedToString(result));
    });
  }
}
