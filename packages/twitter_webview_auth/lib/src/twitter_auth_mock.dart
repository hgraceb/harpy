import 'package:twitter_webview_auth/src/twitter_auth_result.dart';
import 'package:twitter_webview_auth/src/twitter_login_webview.dart';

typedef WebviewNavigation = Future<Uri?> Function(TwitterLoginWebview webview);

class TwitterAuth {
  TwitterAuth({
    required String consumerKey,
    required String consumerSecret,
    required this.callbackUrl,
    this.timeout = const Duration(seconds: 10),
  });

  final String callbackUrl;
  final Duration timeout;

  Future<TwitterAuthResult> authenticateWithTwitter({
    required WebviewNavigation webviewNavigation,
    OnExternalNavigation? onExternalNavigation,
  }) async {
    // https://developer.twitter.com/en/docs/authentication/oauth-1-0a/obtaining-user-access-tokens.
    return TwitterAuthResult.success(
      token: '7588892-kagSNqWge8gB1WwE3plnFsJHAZVfxWD7Vb57p0b4',
      secret: 'PbKfYqSryyeKDWz4ebtY3o5ogNLG11WJuZBc9fQrQo',
      userId: '7588892',
    );
  }
}
