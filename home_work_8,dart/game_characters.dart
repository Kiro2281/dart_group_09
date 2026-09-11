import 'rpg_game.dart';

enum SuperAbility {
  criticalDamage,
  boosting,
  healing,
  blockRevert,
  block,
  dodge,
  resurrection,
  stun,
}

abstract class GameCharacter {
  String name;
  int _health;
  int damage;
  int maxHealth;

  GameCharacter(this.name, this._health, this.damage) : maxHealth = _health;

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
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    if (isStunned) {
      print('Boss $name is stunned and skips this round!');
      isStunned = false;
      return;
    }

    Golem? golem;
    for (var hero in heroes) {
      if (hero is Golem) {
        golem = hero;
        break;
      }
    }

    for (var hero in heroes) {
      if (hero.isAlive()) {
        // Lucky уклоняется с шансом 25%
        if (hero is Lucky && RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${hero.name} dodged the attack!');
          continue;
        }

        int dmg = damage;

        if (hero is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5;
          hero.blockedDamage = block;
          dmg = damage - block;
        }

        if (hero is! Golem && hero is! Berserk && golem != null && golem.isAlive()) {
          int golemDmg = (dmg ~/ 5);
          dmg -= golemDmg;
          golem.health -= golemDmg;
        }

        hero.health -= dmg;
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
  int boostPoints;
  int boost = 0;
  Magic(String name, int health, int damage, this.boostPoints)
    : super(name, health, damage, SuperAbility.boosting);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      for (var hero in heroes) {
        if (hero.isAlive() && name != hero.name) {
          hero.damage += boostPoints;
        }
      }
      print('Magic $name boosted team damage by $boostPoints');
    }
  }
}

// Implementation of boosting
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

class Golem extends Hero {
  Golem(String name, int health, int damage) : super(name, health, damage, SuperAbility.block);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= damage;
  }
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage) : super(name, health, damage, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= damage;
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage) : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    } else {
      boss.health -= damage;
      print('Thor $name hit the boss!');
    }
  }
}

class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrection);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!hasResurrected) {
      for (var resurrectedHero in heroes) {
        if (!resurrectedHero.isAlive()) {
          resurrectedHero.health = this.health;
          this.health = 0;
          hasResurrected = true;
          print('Witcher $name resurrected ${resurrectedHero.name} and died!');
          return;
        }
      }
    }
  }
}
