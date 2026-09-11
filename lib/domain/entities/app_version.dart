class AppVersion {
  const AppVersion({
    required this.platform,
    required this.minVersion,
    required this.latestVersion,
    required this.isRequired,
    required this.isRecommended,
    this.message,
    this.storeUrl,
  });

  final String platform;
  final String minVersion;
  final String latestVersion;
  final bool isRequired;
  final bool isRecommended;
  final String? message;
  final String? storeUrl;
}
