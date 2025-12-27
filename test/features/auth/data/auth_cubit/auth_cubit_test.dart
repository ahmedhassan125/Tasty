import 'package:flutter/services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yumzy/features/auth/data/repo/auth_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:yumzy/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import 'package:yumzy/features/auth/data/models/auth_model.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void setupSecureStorageMock() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel =
  MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return null;
  });
}



void main() {
  late AuthCubit authCubit;
  late MockAuthRepo mockAuthRepo;
  setUpAll(() {
    setupSecureStorageMock();
  });
  setUp(() {
    mockAuthRepo = MockAuthRepo();
    authCubit = AuthCubit.test(mockAuthRepo);
  });

  tearDown(() {
    authCubit.close();
  });

  blocTest<AuthCubit, AuthState>(
    'emits [LogInLoading, LogInSuccess] when login succeeds',
    build: () {
      when(() => mockAuthRepo.logIn(
        email: any(named: 'email'),
        password: any(named: 'password'),
      )).thenAnswer(
            (_) async => UserModel(
          token: 'fake_token',
          code: 200,
          message: 'success',
        ),
      );
      return authCubit;
    },
    act: (cubit) => cubit.logIn(
      email: 'test@test.com',
      password: '123456',
    ),
    expect: () => [
      isA<LogInLoading>(),
      isA<LogInSuccess>(),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'emits [LogInLoading, LogInError] when login fails',
    build: () {
      when(() => mockAuthRepo.logIn(
        email: any(named: 'email'),
        password: any(named: 'password'),
      )).thenThrow(Exception('Login failed'));
      return authCubit;
    },
    act: (cubit) => cubit.logIn(
      email: 'wrong@test.com',
      password: '123456',
    ),
    expect: () => [
      isA<LogInLoading>(),
      isA<LogInError>(),
    ],
  );

}