import UIKit

//MARK: 1. შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.

enum Genre: String {
    case fiction = "Fiction"
    case nonFiction = "Non-Fiction"
    case mystery = "Mystery"
    case sciFi = "Sci-Fi"
    case biography = "Biography"
    
    var description: String {
        switch self {
        case .fiction: return "Fiction"
        case .nonFiction: return "Non-Fiction"
        case .mystery: return "Mystery"
        case .sciFi: return "Sci-Fi"
        case .biography: return "Biography"
        }
    }
}

//MARK: 2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//   - "title: String" ფროფერთი
//   - "author: String" ფროფერთი
//   - "publicationYear: Int" ფროფერთი
//   - "readingLevel: ReadingLevel" ფროფერთი
//   - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘

enum ReadingLevel: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
}

protocol Readable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var readingLevel: ReadingLevel { get }
    
    func read()
}
//MARK: 3. შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.

struct Book: Readable {
    let genre: Genre
    let title: String
    let author: String
    let publicationYear: Int
    let readingLevel: ReadingLevel
    
    init(genre: Genre, title: String, author: String, publicationYear: Int, readingLevel: ReadingLevel) {
        self.genre = genre
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.readingLevel = readingLevel
    }
    
    func read() {
        print("You have successfully read the book: \(title)")
    }
    
    func description() {
        print("The genre: \(genre), the title: \(title), the author: \(author), the publication year: \(publicationYear), the reading level: \(readingLevel).")
    }
}

//MARK: 4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//   - "name: String" - ბიბლიოთეკის სახელი
//   - "books: [Book]" - წიგნების მასივი
//   დაამატეთ მეთოდები:
//   - "add(book: Book)" - წიგნის დამატება
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა
// გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.

class Library {
    let name: String
    var books: [Book]
    
    init(name: String, books: [Book]) {
        self.name = name
        self.books = books
    }
    
    func add(book: Book) {
        if !books.contains(where: { $0.title == book.title }) {
            books.append(book)
        } else {
            print("The book '\(book.title)' is already in the library.")
        }
    }
    
    func removeBookWith(title: String) {
        books.removeAll(where: { $0.title == title })
    }
    
    func listBooks() {
        if books.isEmpty {
            print("There are no books in the library.")
        } else {
            print("Books that are in the library:")
            for book in books {
                print("-\(book.title)")
            }
        }
    }
    
    func filterBooks(by query: (Book) -> Bool) -> [Book] {
        books.filter(query)
    }
}


//MARK: 5.  შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.

func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    var booksByLevel: [ReadingLevel: [T]] = [:]
    
    for book in books {
        booksByLevel[book.readingLevel, default: []].append(book)
    }
    
    return booksByLevel
}


let mazeRunner = Book(genre: .sciFi, title: "The Maze Runner", author: "James Dashner", publicationYear: 2009, readingLevel: .intermediate)
let hungerGames = Book(genre: .fiction, title: "The Hunger Games", author: "Suzanne Collins", publicationYear: 2008, readingLevel: .intermediate)
let harryPotter = Book(genre: .fiction, title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", publicationYear: 1997, readingLevel: .beginner)
let divergent = Book(genre: .sciFi, title: "Divergent", author: "Veronica Roth", publicationYear: 2011, readingLevel: .intermediate)
let theAlchemist = Book(genre: .fiction, title: "The Alchemist", author: "Paulo Coelho", publicationYear: 1988, readingLevel: .beginner)

let bestSellerBooks = [mazeRunner, hungerGames, harryPotter, divergent, theAlchemist]

let groupedBooks = groupBooksByLevel(bestSellerBooks)

for (level, books) in groupedBooks {
    print("\(level.rawValue) level books:")
    for book in books {
        print(" - \(book.title)")
    }
}

print("-----------------")

//MARK: 6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//   - "id: Int"
//   - "name: String"
//   - "borrowedBooks: [Book]"
//   დაამატეთ მეთოდები:
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში

class LibraryMember {
    let id: Int
    let name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String, borrowedBooks: [Book] = []) {
        self.id = id
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(_ book: Book, from library: Library) {
        if borrowedBooks.contains(where: { $0.title == book.title }) {
            print("\(name) has already borrowed '\(book.title)'.")
            return
        }
        
        if let index = library.books.firstIndex(where: { $0.title == book.title }) {
            library.books.remove(at: index)
            borrowedBooks.append(book)
            print("\(name) borrowed '\(book.title)'")
        } else {
            print("The book '\(book.title)' is not available in the library.")
        }
    }
    
    func returnBook(_ book: Book, to library: Library) {
        if let index = borrowedBooks.firstIndex(where: { $0.title == book.title }) {
            borrowedBooks.remove(at: index)
            library.add(book: book)
            print("\(name) returned '\(book.title)'")
        } else {
            print("The book '\(book.title)' was not borrowed by \(name).")
        }
    }
}

//MARK: 7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ

let library = Library(name: "Library 1", books: [])

library.add(book: mazeRunner)
library.add(book: hungerGames)
library.add(book: harryPotter)
library.add(book: divergent)
library.add(book: theAlchemist)


library.listBooks()

print("-----------------")

library.removeBookWith(title: "The Alchemist")

print(library.filterBooks { $0.publicationYear > 2000 })

print("-----------------")


//MARK: 8. შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//   - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//   - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//   დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია


let LibraryMemberOne = LibraryMember(id: 1, name: "Ana")
let LibraryMemberTwo = LibraryMember(id: 2, name: "Tristan")

LibraryMemberOne.borrowBook(mazeRunner, from: library)
LibraryMemberTwo.borrowBook(divergent, from: library)
LibraryMemberTwo.borrowBook(harryPotter, from: library)

LibraryMemberTwo.returnBook(divergent, to: library)

print("-----------------")

print("\(LibraryMemberOne.name)'s borrowed books:")
for book in LibraryMemberOne.borrowedBooks {
    print(" - \(book.title)")
}

print("\(LibraryMemberTwo.name)'s borrowed books:")
for book in LibraryMemberTwo.borrowedBooks {
    print(" - \(book.title)")
}

print("-----------------")


//MARK: 9. გააფართოვეთ "Array" ტიპი, სადაც ელემენტი აკმაყოფილებს "Readable" პროტოკოლს (ანუ ამ ექსთენშენი მოცემული მეთოდები ხელმსიაწვდომი იქნება მხოლოდ [Readable] მასივისთვის), შემდეგი მეთოდებით:
//   - "findByAuthor(_ author: String) -> [Readable]" - აბრუნებს ავტორის მიხედვით ნაპოვნ წიგნებს
//   - "oldestBook() -> Readable?" - აბრუნებს ყველაზე ძველ წიგნს


extension Array where Element: Readable {
    func findByAuthor(_ author: String) -> [Readable] {
        self.filter { $0.author == author }
    }
    
    func oldestBook() -> Readable? {
        self.min { $0.publicationYear < $1.publicationYear }
    }
}

//MARK: 10. შექმენით "EBook" სტრუქტურა, რომელიც დააკმაყოფილებს "Readable" პროტოკოლს და დაამატეთ "fileSize: Double" ფროფერთი.
//  გამოიყენეთ "extension", რომ დაამატოთ "printDetails()" მეთოდი, რომელიც დაბეჭდავს ელექტრონული წიგნის დეტალებს.
//  შექმენით მინიმუმ 2 "EBook" ობიექტი და გამოიძახეთ "printDetails()" მეთოდი თითოეულისთვის.

struct EBook: Readable {
    let fileSize: Double
    let title: String
    let author: String
    let publicationYear: Int
    let readingLevel: ReadingLevel
    
    func read() {
        print("You have successfully read the book: \(title)")
    }
}

extension EBook {
    func printDetails() {
        print("Book title: \(title), author: \(author), publication year: \(publicationYear), reading level: \(readingLevel), file size: \(fileSize)")
    }
}

let eBookOne = EBook(fileSize: 98.2, title: "The Godfather", author: "Mario Puzo", publicationYear: 1969, readingLevel: .intermediate)
let eBookTwo = EBook(fileSize: 67.5, title: "Fight Club", author: "Chuck Palahniuk", publicationYear: 1996, readingLevel: .advanced)

eBookOne.printDetails()
eBookTwo.printDetails()

print("-----------------")

//MARK: 11. შექმენით ჯენერიკ ფუნქცია "findMostFrequent<T: Hashable>(_ array: [T]) -> T?", რომელიც იპოვის და დააბრუნებს მასივში ყველაზე ხშირად გამეორებულ ელემენტს. თუ რამდენიმე ელემენტი თანაბრად ხშირად მეორდება, დააბრუნეთ პირველი მათგანი.

func findMostFrequent<T: Hashable>(_ array: [T]) -> T? {
    var frequency: [T: Int] = [:]
    
    for element in array {
        frequency[element, default: 0] += 1
    }
    
    return frequency.max(by: { $0.value < $1.value })?.key
}

//MARK: 12. შექმენით მასივი, რომელიც შეიცავს ყველა წიგნის ავტორს მე-7 დავალებაში შექმნილი ბიბლიოთეკიდან.
//გამოიძახეთ "findMostFrequent" ფუნქცია ამ მასივზე, რათა იპოვოთ ყველაზე პოპულარული ავტორი.
//დაბეჭდეთ შედეგი: "ბიბლიოთეკაში ყველაზე პოპულარული ავტორი არის: [ავტორის სახელი]".

let authors = library.books.map { $0.author }

if let mostPopularAuthor = findMostFrequent(authors) {
    print("The most popular author in the library is: \(mostPopularAuthor)")
} else {
    print("No authors found.")
}
