class PluginsModel {
  late String _pluginName;
  late String _pluginVersion;
  late int _likes;
  late String _pluginPubAddress;
  late String _pluginGitHubAddress;

  String get pluginName => _pluginName;
  String get pluginVersion => _pluginVersion;
  int get likes => _likes;
  String get pluginPubAddress => _pluginPubAddress;
  String get pluginGitHubAddress => _pluginGitHubAddress;

  PluginsModel(String pluginName, String pluginVersion, int likes,
      String pluginPubAddress, String pluginGitHubAddress) {
    _pluginName = pluginName;
    _pluginVersion = pluginVersion;
    _likes = likes;
    _pluginPubAddress = pluginPubAddress;
    _pluginGitHubAddress = pluginGitHubAddress;
  }
}
