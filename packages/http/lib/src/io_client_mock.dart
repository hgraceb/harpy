import 'base_client.dart';
import 'base_request.dart';
import 'client_send_mock.dart';
import 'io_client.dart' as io;
import 'io_streamed_response.dart';

BaseClient createClient() => IOClient();

class IOClient extends io.IOClient {
  IOStreamedResponse _mockSend(int statusCode, String responseBody) {
    return IOStreamedResponse(
      Stream.fromIterable([responseBody].map((s) => s.codeUnits)),
      statusCode,
    );
  }

  @override
  Future<IOStreamedResponse> send(BaseRequest request) async {
    return mockSend<IOStreamedResponse>(super.send, _mockSend, request);
  }
}
