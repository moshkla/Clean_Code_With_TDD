import 'package:clean_code/core/use_cases/use_case.dart';
import 'package:clean_code/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_code/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_code/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test(
    'should get trivia from the repository',
        () async {
      // arrange
      when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase!(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}


