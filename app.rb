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

  def add_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @list_of_rentals << rental
  end

  def create_book(title, author)
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
    print ""
    (date, book, person)
  end

  def display_list_of_books
    @list_of_books.each_with_index do |book, index|
      puts "#{index + 1} - Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_list_of_people
    @list_of_people.each_with_index do |person, index|
      puts "#{index + 1} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

app = App.new()
# app.add_student("Math 001", 21, "Shinhyo")
# app.add_teacher("Math", 33, "Juan")
# app.display_list_of_people