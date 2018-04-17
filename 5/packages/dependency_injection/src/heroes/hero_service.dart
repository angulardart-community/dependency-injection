import 'package:angular/angular.dart';

import '../logger_service.dart';
import 'hero.dart';
import 'mock_heroes.dart';

@Injectable()
class HeroService {
  final Logger _logger;
  final bool _isAuthorized;

  HeroService(this._logger, this._isAuthorized);

  List<Hero> getAll() {
    var auth = _isAuthorized ? 'authorized' : 'unauthorized';
    _logger.fine('Getting heroes for $auth user.');
    return mockHeroes.where((hero) => _isAuthorized || !hero.isSecret).toList();
  }
}
