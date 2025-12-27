import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yumzy/core/network/api_service.dart';
import 'package:yumzy/features/auth/data/repo/auth_repo.dart';
import 'package:yumzy/features/auth/data/models/auth_model.dart';
class MockApiService extends Mock implements ApiService {}
void main() {
  late MockApiService mockApiService;
  late AuthRepo authRepo;

  setUp(() {
    mockApiService = MockApiService();
    authRepo = AuthRepo(mockApiService);
  });

  test('logIn returns UserModel when api call succeeds', () async {
    // Arrange (تجهيز)
    final fakeResponse = {
      'data': {
        'id': 1,
        'name': 'Ahmed',
        'email': 'ahmed@test.com',
        'token': 'fake_token_123',
      }
    };

    when(() => mockApiService.postData(
      endPoint: any(named: 'endPoint'),
      data: any(named: 'data'),
    )).thenAnswer((_) async => fakeResponse);

    // Act (تنفيذ)
    final result = await authRepo.logIn(
      email: 'ahmed@test.com',
      password: '123456',
    );

    // Assert (تأكيد)
    expect(result, isA<UserModel>());
    expect(result.token, 'fake_token_123');
    expect(result.name, 'Ahmed');
  });



}