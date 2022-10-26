import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:food_order_ui/core/platform/network/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'network_info_test.mocks.dart';

class FakeDataConnectionChecker extends Mock implements DataConnectionChecker {}

@GenerateMocks([FakeDataConnectionChecker])
void main() {
  late MockFakeDataConnectionChecker mockFakeDataConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockFakeDataConnectionChecker = MockFakeDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockFakeDataConnectionChecker);
  });

  group('is Connected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(true);

      when(mockFakeDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      final result = await networkInfoImpl.isConnected;

      verify(mockFakeDataConnectionChecker.hasConnection);

      expect(result, await tHasConnectionFuture);
    });
    test('should no forward the call to DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(false);

      when(mockFakeDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      final result = await networkInfoImpl.isConnected;

      verify(mockFakeDataConnectionChecker.hasConnection);

      expect(result, await tHasConnectionFuture);
    });
  });
}
