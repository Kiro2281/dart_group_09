import 'dart:io';

import 'game_characters.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    Boss boss = Boss('Diablo', 2000, 50);

    Warrior warrior1 = Warrior('Knight', 270, 15);
    Warrior warrior2 = Warrior('Dark Knight', 280, 10);
    Magic magic = Magic('Merlin', 290, 10,10);
    Berserk berserk = Berserk('Gutz', 260, 15);
    Medic doc = Medic('Stein', 250, 5, 15);
    Medic assistant = Medic('Sara', 300, 5, 5);
    Golem guard = Golem('Guard', 700, 1);
    Lucky assasin = Lucky('Killer', 150, 20);
    Witcher sorceer = Witcher('Iron Heart', 1000, 0);
    Thor thunder = Thor("Flash", 100, 10);
    List<Hero> heroes = [warrior1, doc, berserk, warrior2, assistant, magic ,guard , assasin,sorceer,thunder];

    _printStatisticts(boss, heroes);

    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (var hero in heroes) {
      if (hero.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && hero.ability != boss.defence) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
    _printStatisticts(boss, heroes);
  }

  static void _printStatisticts(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber --------------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}
