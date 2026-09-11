abstract class SocketConfig {
  static const List<String> transports = ['websocket'];
  static const Duration chargeResultTimeout = Duration(seconds: 60);
  static const String chargeSucceeded = 'charge.succeeded';
  static const String chargeFailed = 'charge.failed';
}
