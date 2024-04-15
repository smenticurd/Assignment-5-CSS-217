class Furniture {
    var name: String
    var style: String
    var material: String
    var price: Float
    
    init(name: String, style: String, material: String, price: Float) {
        self.name = name
        self.style = style
        self.material = material
        self.price = price
    }
}

protocol FurnitureFactory {
    func createChair() -> Chair
    func createTable() -> Table
    func createSofa() -> Sofa
}

class ModernWoodFactory: FurnitureFactory {
    func createChair() -> Chair {
        return Chair(name: "Modern Wood Chair", style: "Modern", material: "Wood", price: 100)
    }
    
    func createTable() -> Table {
        return Table(name: "Modern Wood Table", style: "Modern", material: "Wood", price: 200)
    }
    
    func createSofa() -> Sofa {
        return Sofa(name: "Modern Wood Sofa", style: "Modern", material: "Wood", price: 300)
    }
}

class TraditionalMetalFactory: FurnitureFactory {
    func createChair() -> Chair {
        return Chair(name: "Traditional Metal Chair", style: "Traditional", material: "Metal", price: 120)
    }
    
    func createTable() -> Table {
        return Table(name: "Traditional Metal Table", style: "Traditional", material: "Metal", price: 220)
    }
    
    func createSofa() -> Sofa {
        return Sofa(name: "Traditional Metal Sofa", style: "Traditional", material: "Metal", price: 320)
    }
}

class Chair: Furniture {}
class Table: Furniture {}
class Sofa: Furniture {}

class FurnitureCreator {
    var factory: FurnitureFactory?
    
    func setFactory(factory: FurnitureFactory) {
        self.factory = factory
    }
    
    func createChair() -> Chair? {
        return factory?.createChair()
    }
    
    func createTable() -> Table? {
        return factory?.createTable()
    }
    
    func createSofa() -> Sofa? {
        return factory?.createSofa()
    }
}

class FurnitureMarketplace {
    var creators: [String: FurnitureCreator] = [:]
    
    func addFactory(factory: FurnitureFactory, key: String) {
        let creator = FurnitureCreator()
        creator.setFactory(factory: factory)
        creators[key] = creator
    }
    
    func getProducts(style: String, material: String) -> (Chair?, Table?, Sofa?)? {
        guard let creator = creators["\(style)\(material)"] else { return nil }
        return (creator.createChair(), creator.createTable(), creator.createSofa())
    }
}

let marketplace = FurnitureMarketplace()

let modernWoodFactory = ModernWoodFactory()
let traditionalMetalFactory = TraditionalMetalFactory()

marketplace.addFactory(factory: modernWoodFactory, key: "ModernWood")
marketplace.addFactory(factory: traditionalMetalFactory, key: "TraditionalMetal")

if let (chair, table, sofa) = marketplace.getProducts(style: "Modern", material: "Wood") {
    print("Available Modern Wood Furniture:")
    print("Chair: \(String(describing: chair?.name)), Price: $\(chair?.price ?? 5)")
    print("Table: \(table?.name ?? "Table1"), Price: $\(table?.price ?? 6)")
    print("Sofa: \(sofa?.name ?? "Sofa 1"), Price: $\(sofa?.price ?? 7)")
} else {
    print("No products available for the selected style and material.")
}

