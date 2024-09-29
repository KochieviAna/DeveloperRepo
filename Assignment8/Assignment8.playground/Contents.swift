import UIKit

//MARK: 1. შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
//title - ფილმის სახელი,
//releaseYear— გამოშვების წელი,
//genre — ფილმის ჟანრი,
//revenue - შემოსავალი
//მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.

enum Genre: String {
    case action = "Action",
         drama = "Drama",
         comedy = "Comedy",
         thriller = "Thriller"
}

class Film {
    let title: String
    let releaseYear: Int
    let genre: Genre
    let revenue: Double
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Double) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("The title of film is \(title), release year is \(releaseYear), genre is \(genre), revenue is \(revenue).")
    }
}

//MARK: 2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.

class Person {
    let name: String
    let birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge() -> Int {
        let currentYear = 2024
        let age = currentYear - birthYear
        return age
    }
}

//MARK: 3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.

extension Film {
    func removeFilm(from films: inout [Film], by title: String) {
        if let index = films.firstIndex(where: { $0.title == title }) {
            films.remove(at: index)
        }
    }
}

//MARK: 4. შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი. Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.

class Actor: Person {
    var actedFilms: [Film]
    
    init(actedFilms: [Film], name: String, birthYear: Int) {
        self.actedFilms = actedFilms
        super.init(name: name, birthYear: birthYear)
    }
    
    func addActedFilm(_ film: Film) {
        actedFilms.append(film)
    }
}

//MARK: 5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი. დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.

class Director: Person {
    var directedFilms: [Film]
    var totalRevenue: Double
    
    init(directedFilms: [Film], totalRevenue: Double, name: String, birthYear: Int) {
        self.directedFilms = directedFilms
        self.totalRevenue = totalRevenue
        super.init(name: name, birthYear: birthYear)
    }
    
    func addDirectedFilm(_ film: Film) {
        directedFilms.append(film)
        totalRevenue += film.revenue
    }
}

//MARK: 6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.

let inception = Film(title: "Inception", releaseYear: 2010, genre: .thriller, revenue: 830.0)
let ironMan = Film(title: "Iron Man", releaseYear: 2008, genre: .action, revenue: 585.0)
let avengersEndgame = Film(title: "Avengers: Endgame", releaseYear: 2019, genre: .action, revenue: 2798.0)
let theIntern = Film(title: "The Intern", releaseYear: 2015, genre: .comedy, revenue: 195.0)
let joker = Film(title: "Joker", releaseYear: 2019, genre: .drama, revenue: 107.4)

let actor1 = Actor(actedFilms: [inception], name: "Leonardo DiCaprio", birthYear: 1974)
let actor2 = Actor(actedFilms: [ironMan, avengersEndgame], name: "Robert Downey Jr.", birthYear: 1965)
let actor3 = Actor(actedFilms: [avengersEndgame, joker], name: "Scarlett Johansson", birthYear: 1984)
let actor4 = Actor(actedFilms: [inception, joker], name: "Tom Hardy", birthYear: 1977)
let actor5 = Actor(actedFilms: [theIntern], name: "Anne Hathaway", birthYear: 1982)

var actorFilms: [String: [Film]] = [
    actor1.name: actor1.actedFilms,
    actor2.name: actor2.actedFilms,
    actor3.name: actor3.actedFilms,
    actor4.name: actor4.actedFilms,
    actor5.name: actor5.actedFilms
]

//MARK: 7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან

let filmsArray: [Film] = [inception, ironMan, avengersEndgame, theIntern, joker]

let filmTitles: [String] = filmsArray.map(\.title)

print(filmTitles)

//MARK: 8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.

let averageReleaseYear: Int = filmsArray.reduce(0) { $0 + $1.releaseYear } / filmsArray.count

print(averageReleaseYear)

//MARK: 9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
//name სუპერ გმირის სახელი
//superPower  სუპერ ძალა
//level - PowerLevel enum-ის ტიპის,
//და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
//დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები

class SuperHero {
    let name: String
    let superPower: String
    let level: PowerLevel
    var allies: [String]
    
    init(name: String, superPower: String, level: PowerLevel, allies: [String]) {
        self.name = name
        self.superPower = superPower
        self.level = level
        self.allies = allies
    }
    
    deinit {
        print("Deinit has been called")
    }
}

//MARK: 10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.

enum PowerLevel: String {
    case weak = "Weak"
    case average = "Average"
    case strong = "Strong"
    case superStrongPower = "Super"
    
    func describe() -> String {
        return self.rawValue
    }
}

extension SuperHero {
    func describe() -> String {
        return "\(name) has as superpower level \(level.describe())"
    }
}
//MARK: 11. uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას
extension SuperHero {
    func uniquePowers(from heroes: [SuperHero]) -> Set<String> {
        let allPowers = heroes.map { $0.superPower }
        let uniquePowers = Set(allPowers)
        return uniquePowers
    }
}
//MARK: 12.  მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.
extension SuperHero {
    func addAlly(allies: [SuperHero]) {
        for ally in allies {
            self.allies.append(ally.name)
            ally.allies.append(self.name)
        }
    }
}

let hero1 = SuperHero(name: "Flash", superPower: "Speed", level: .superStrongPower, allies: [])
let hero2 = SuperHero(name: "Superman", superPower: "Strength", level: .superStrongPower, allies: [])

hero1.addAlly(allies: [hero2])

print("\(hero1.name)'s allies: \(hero1.allies)")
print("\(hero2.name)'s allies: \(hero2.allies)")
