part of 'count_numbers_bloc.dart';

@freezed
class CountNumbersState with _$CountNumbersState {
  const factory CountNumbersState.initial() = _Initial;
  const factory CountNumbersState.loaded(List<int> numbers) = _Loaded;
  const factory CountNumbersState.loadedToString(List<String> numbers) = _LoadedToString;
}
