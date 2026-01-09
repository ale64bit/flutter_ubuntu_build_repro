import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:logging/logging.dart';

class AudioController {
  static final Logger _log = Logger('AudioController');
  static AudioController? _instance;

  factory AudioController() => _instance!;
  final SoLoud _soloud;

  static Future<void> init() async {
    _log.info('init');
    assert(_instance == null);
    final soloud = SoLoud.instance;
    await soloud.init();
    _instance = AudioController._(soloud);
  }

  AudioController._(this._soloud);

  void dispose() {
    _soloud.deinit();
  }
}
