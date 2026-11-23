import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yol_gecme/oyun_yol_gecme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yolgecmeConfig.title.length, 33);
    expect(yolgecmeConfig.tagline.length, 33);
    for (final s in yolgecmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yolgecmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yolgecmeId, optionalMechanics: yolgecmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yolgecmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
