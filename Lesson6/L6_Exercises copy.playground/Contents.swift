//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    init (speciesName: String, tailLength: Double) {
        self.species = speciesName
        self.tail = Tail(lengthInCm: tailLength)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
var kitten = Animal(speciesName: "Cat", tailLength: 10)
var puppy = Animal(speciesName: "Dog", tailLength: 15)

//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    static let varieties = ["White","Yellow"]
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen(){
        softness += 1
        if self.softness > 4 {
            print("Eat me!")
        } else {
            print( "Give me a little more time.")
        }
    }
}

//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
let peach = Peach(variety: "Yellow", softness: 3)
peach.ripen()
//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
//var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    var cuddlability: Int {
        get {
            return self.fluffiness - self.droolFactor
        }
    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(_ wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
var goodDog = FluffyDog(name: "Sasha", fluffiness: 100, droolFactor: 1)
goodDog.cuddlability
goodDog.chase("kitten")
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case small
    case medium
    case large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    func bark(_ size: Size) -> String {
        switch size {
        case .small:
            return "yip yip"
        case .medium:
            return "arf arf"
        case .large:
            return "woof woof"
        }
    }
    static func speak(_ size: Size) -> String {
        switch size {
        case .small:
            return "yip yip"
        case .medium:
            return "arf arf"
        case .large:
            return "woof woof"
        }
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().

//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
var barkingDog = ChattyDog(name:"Catz", breed:"Mutt", size: .medium)
barkingDog.bark(barkingDog.size)
ChattyDog.speak(.medium)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case poor, fair, good, excellent
}

enum NaturalDisaster {
    case earthquake
    case wildfire
    case hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    
    init (numberOfBeds: Int, location: Quality){
        self.numberOfBedrooms  = numberOfBeds
        self.location = location
    }
 
    func willStayStanding(_ naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .earthquake:
            return true
        case .wildfire:
            return true
        case .hurricane:
            return false
        }
    }
    var worthyOfAnOffer: Bool {
        get {
            switch (numberOfBedrooms, location) {
                case (2, .excellent), (3, .good), ( 3, .excellent):
                    return true
            default:
                return false
            }
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.

//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.

let dreamHouse = House(numberOfBeds: 3, location: .excellent)
dreamHouse.willStayStanding(.earthquake)
dreamHouse.worthyOfAnOffer




