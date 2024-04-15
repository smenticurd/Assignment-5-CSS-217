class Character {
    var name: String
    var charClass: String
    var weapon: Weapon
    var health: Int
    var mana: Int
    
    init(name: String, charClass: String, weapon: Weapon, health: Int, mana: Int) {
        self.name = name
        self.charClass = charClass
        self.weapon = weapon
        self.health = health
        self.mana = mana
    }
}

class Weapon {
    var type: String
    var damage: Int
    var speed: Int
    var range: Int
    
    init(type: String, damage: Int, speed: Int, range: Int) {
        self.type = type
        self.damage = damage
        self.speed = speed
        self.range = range
    }
}

protocol CharacterFactory {
    func createCharacter(name: String) -> Character
    func createWeapon() -> Weapon
}

class WarriorSwordFactory: CharacterFactory {
    func createCharacter(name: String) -> Character {
        let weapon = createWeapon()
        return Character(name: name, charClass: "Warrior", weapon: weapon, health: 100, mana: 50)
    }
    
    func createWeapon() -> Weapon {
        return Weapon(type: "Sword", damage: 20, speed: 10, range: 1)
    }
}

class MageStaffFactory: CharacterFactory {
    func createCharacter(name: String) -> Character {
        let weapon = createWeapon()
        return Character(name: name, charClass: "Mage", weapon: weapon, health: 80, mana: 100)
    }
    
    func createWeapon() -> Weapon {
        return Weapon(type: "Staff", damage: 15, speed: 8, range: 5)
    }
}

class ArcherBowFactory: CharacterFactory {
    func createCharacter(name: String) -> Character {
        let weapon = createWeapon()
        return Character(name: name, charClass: "Archer", weapon: weapon, health: 90, mana: 70)
    }
    
    func createWeapon() -> Weapon {
        return Weapon(type: "Bow", damage: 18, speed: 12, range: 10)
    }
}

class CharacterCreator {
    var factory: CharacterFactory?
    
    func setFactory(factory: CharacterFactory) {
        self.factory = factory
    }
    
    func createCharacter(name: String) -> Character? {
        return factory?.createCharacter(name: name)
    }
}

class Game {
    var players: [Character] = []
    
    func addPlayer(player: Character) {
        players.append(player)
    }
    
    func playOnline() {
        print("Playing online with \(players.count) players:")
        for player in players {
            print("\(player.name) - Class: \(player.charClass), Weapon: \(player.weapon.type)")
        }
    }
}

let game = Game()
let creator = CharacterCreator()

let warriorSwordFactory = WarriorSwordFactory()
let mageStaffFactory = MageStaffFactory()
let archerBowFactory = ArcherBowFactory()

creator.setFactory(factory: warriorSwordFactory)
if let warrior = creator.createCharacter(name: "Warrior") {
    game.addPlayer(player: warrior)
}

creator.setFactory(factory: mageStaffFactory)
if let mage = creator.createCharacter(name: "Mage") {
    game.addPlayer(player: mage)
}

creator.setFactory(factory: archerBowFactory)
if let archer = creator.createCharacter(name: "Archer") {
    game.addPlayer(player: archer)
}

game.playOnline()

