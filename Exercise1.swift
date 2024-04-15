import Foundation


class Appearance {
    var hairColor: String
    var armorType: String
    
    init(hairColor: String, armorType: String) {
        self.hairColor = hairColor
        self.armorType = armorType
    }
}

class Ability {
    var name: String
    var damage: Int
    
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}

class Equipment {
    var weapon: String
    var armor: String
    
    init(weapon: String, armor: String) {
        self.weapon = weapon
        self.armor = armor
    }
}

class Attribute {
    var strength: Int
    var intelligence: Int
    var agility: Int
    
    init(strength: Int, intelligence: Int, agility: Int) {
        self.strength = strength
        self.intelligence = intelligence
        self.agility = agility
    }
}

class Character {
    var name: String
    var appearance: Appearance
    var abilities: [Ability]
    var equipment: [Equipment]
    var attributes: Attribute
    
    init(name: String, appearance: Appearance, abilities: [Ability], equipment: [Equipment], attributes: Attribute) {
        self.name = name
        self.appearance = appearance
        self.abilities = abilities
        self.equipment = equipment
        self.attributes = attributes
    }
}

class CharacterFactory {
    func createCharacter(name: String) -> Character {
        fatalError("This method must be overridden")
    }
}

class WarriorFactory: CharacterFactory {
    override func createCharacter(name: String) -> Character {
        let appearance = Appearance(hairColor: "Blonde", armorType: "Plate")
        let abilities = [Ability(name: "Slash", damage: 10), Ability(name: "Bash", damage: 8)]
        let equipment = [Equipment(weapon: "Sword", armor: "Shield")]
        let attributes = Attribute(strength: 15, intelligence: 5, agility: 10)
        
        return Character(name: name, appearance: appearance, abilities: abilities, equipment: equipment, attributes: attributes)
    }
}

class MageFactory: CharacterFactory {
    override func createCharacter(name: String) -> Character {
        let appearance = Appearance(hairColor: "White", armorType: "Robe")
        let abilities = [Ability(name: "Fireball", damage: 15), Ability(name: "Teleport", damage: 0)]
        let equipment = [Equipment(weapon: "Staff", armor: "Cloak")]
        let attributes = Attribute(strength: 5, intelligence: 20, agility: 8)
        
        return Character(name: name, appearance: appearance, abilities: abilities, equipment: equipment, attributes: attributes)
    }
}

class ArcherFactory: CharacterFactory {
    override func createCharacter(name: String) -> Character {
        let appearance = Appearance(hairColor: "Brown", armorType: "Leather")
        let abilities = [Ability(name: "Arrow Shot", damage: 12), Ability(name: "Stealth", damage: 0)]
        let equipment = [Equipment(weapon: "Bow", armor: "Quiver")]
        let attributes = Attribute(strength: 10, intelligence: 8, agility: 15)
        
        return Character(name: name, appearance: appearance, abilities: abilities, equipment: equipment, attributes: attributes)
    }
}

class CharacterCreator {
    private var factory: CharacterFactory
    
    init(factory: CharacterFactory) {
        self.factory = factory
    }
    
    func setFactory(factory: CharacterFactory) {
        self.factory = factory
    }
    
    func createCharacter(name: String) -> Character {
        return factory.createCharacter(name: name)
    }
}

let characterCreator = CharacterCreator(factory: WarriorFactory())
let warrior = characterCreator.createCharacter(name: "Charles")

print("Warrior Name: \(warrior.name)")
print("Warrior Appearance: Hair Color - \(warrior.appearance.hairColor), Armor Type - \(warrior.appearance.armorType)")
print("Warrior Abilities:")
for ability in warrior.abilities {
    print("- \(ability.name): Damage - \(ability.damage)")
}
print("Warrior Equipment:")
for equipment in warrior.equipment {
    print("- Weapon: \(equipment.weapon), Armor: \(equipment.armor)")
}
print("Warrior Attributes: Strength - \(warrior.attributes.strength), Intelligence - \(warrior.attributes.intelligence), Agility - \(warrior.attributes.agility)")
