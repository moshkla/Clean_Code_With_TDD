import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  String? text;

  int? number;

  NumberTrivia({
    required this.text,
    required this.number,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [text, number];
}
