part of 'count_numbers_bloc.dart';

@freezed
class CountNumbersEvent with _$CountNumbersEvent {
  const factory CountNumbersEvent.started() = _Started;
  const factory CountNumbersEvent.countFirst(int input) = _CountFirst;
  const factory CountNumbersEvent.countSecond(int input) = _CountSecound;
  const factory CountNumbersEvent.countThird(int input) = _CountThird;
  const factory CountNumbersEvent.countFourth(int input) = _CountFourth;
}
