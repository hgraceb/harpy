import 'base_client.dart';
import 'base_request.dart';
import 'browser_client.dart' as browser;
import 'client_send_mock.dart';
import 'streamed_response.dart';

BaseClient createClient() => BrowserClient();

class BrowserClient extends browser.BrowserClient {
  StreamedResponse _mockSend(int statusCode, String responseBody) {
    return StreamedResponse(
      Stream.fromIterable([responseBody].map((s) => s.codeUnits)),
      statusCode,
    );
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    return mockSend<StreamedResponse>(super.send, _mockSend, request);
  }
}
