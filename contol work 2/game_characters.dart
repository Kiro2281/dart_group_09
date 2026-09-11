import 'rpg_game.dart';

enum SuperAbility { criticalDamage, boosting, healing, blockRevert, gambling }

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  GameCharacter(this.name, this._health, this.damage);

  int get health => _health;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  bool isAlive() {
    return _health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive()) {
        if (hero is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
          hero.blockedDamage = block;
          hero.health -= (damage - block);
        } else {
          hero.health -= damage;
        }
      }
    }
  }

  @override
  String toString() {
    String d = 'No defence';
    if (defence != null) {
      d = defence!.name;
    }
    return '${super.toString()} defence: $d';
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = damage * (RpgGame.random.nextInt(5) + 2); // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage) : super(name, health, damage, SuperAbility.boosting);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    // Implementation of boosting
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Medic extends Hero {
  int healPoints;
  Medic(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.healing);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && name != hero.name) {
        hero.health += healPoints;
      }
    }
  }
}

class Gambler extends Hero {
  Gambler(String name, int health, int damage) : super(name, health, damage, SuperAbility.gambling);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;

    print('Gambler $name rolled: $dice1 and $dice2');

    if (dice1 == dice2) {
      int damageAmount = dice1 * dice2;
      boss.health -= damageAmount;
      print('Lucky! Boss takes $damageAmount damage');
    } else {
      int damageAmount = dice1 + dice2;
      int randomIndex = RpgGame.random.nextInt(heroes.length);
      Hero ally = heroes[randomIndex];

      if (ally.name != name && ally.isAlive()) {
        ally.health -= damageAmount;
        print('Loss! ${ally.name} takes $damageAmount damage');
      }
    }
  }
}
