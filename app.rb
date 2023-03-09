require './book'
require './student'
require './teacher'
require './rental'

class App
  attr_accessor :list_of_books
  def initialize
    @list_of_books = []
    @list_of_people = []
    @list_of_rentals = []
  end

  def add_student(classroom, age, name)
    student = Student.new(classroom, age, name)
    @list_of_people << student
  end

  def add_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @list_of_people << teacher
  end

  def add_rental(date, book_index, person_index)
    rental = Rental.new(date, @list_of_books[book_index], @list_of_people[person_index])
    @list_of_rentals << rental
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    @list_of_books << new_book
  end

  def create_person
    correct_type = false
    while !correct_type
      print "Create a student (1) or a teacher (2)? [input the number]: "
      person_type = gets.chomp
  
      case person_type
      when '1'
        print "Name: "
        name = gets.chomp.capitalize
        print "Age: "
        age = gets.chomp
        print "Classroom: "
        classroom = gets.chomp.capitalize

        add_student(classroom, age, name)
        correct_type = true
        puts "\nStudent created successfully!"
      when '2'
        print "Name: "
        name = gets.chomp.capitalize
        print "Age: "
        age = gets.chomp
        print "Specialization: "
        specialization = gets.chomp.capitalize

        add_teacher(specialization, age, name)
        correct_type = true
        puts "\nTeacher created successfully!"
      else
        puts "Wrong input, please select between 1 or 2 for student or teacher"
      end
    end
  end

  def create_rental
    puts "*- Create rental -*"
    puts "Select a book from the following list by number"
    display_list_of_books
    print "Select a book: "
    book_index = gets.chomp
    puts "Select a person from the following list by number (not id)"
    display_list_of_people
    print "Select a person: "
    person_index = gets.chomp
    puts "Date [yyyy/mm/dd]: "
    date = gets.chomp
    add_rental(date, book_index, person_index)
  end

  def display_list_of_books
    @list_of_books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_list_of_people
    @list_of_people.each_with_index do |person, index|
      puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

app = App.new()
app.add_book("game of thones", "author")
app.add_book("game of hunger", "author")
app.add_book("game of games", "author")
app.create_rental
# app.add_student("Math 001", 21, "Shinhyo")
# app.add_teacher("Math", 33, "Juan")
# app.display_list_of_people