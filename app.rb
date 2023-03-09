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
    rental = Rental.new(date, @list_of_books[book_index.to_i], @list_of_people[person_index.to_i])
    @list_of_rentals << rental
  end

  def add_book(title, author)
    new_book = Book.new(title, author)
    @list_of_books << new_book
  end

  def create_book
    puts "\n*- Create a book -*"
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    add_book(title, author)
    puts "\nBook successfully created"
  end

  def student_case
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp.capitalize
    add_student(classroom, age, name)
  end

  def teacher_case
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    add_teacher(specialization, age, name)
  end

  def create_person
    correct_type = false
    until correct_type
      print 'Create a student (1) or a teacher (2)? [input the number]: '
      person_type = gets.chomp

      case person_type
      when '1'
        student_case
        correct_type = true
        puts "\nStudent created successfully!"
      when '2'
        teacher_case
        correct_type = true
        puts "\nTeacher created successfully!"
      else
        puts 'Wrong input, please select between 1 or 2 for student or teacher'
      end
    end
  end

  def create_rental
    puts "\n*- Create rental -*"
    puts "\nSelect a book from the following list by number"
    display_list_of_books
    print "\nSelect a book: "
    book_index = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    display_list_of_people
    print "\nSelect a person: "
    person_index = gets.chomp
    print 'Date [yyyy/mm/dd]: '
    date = gets.chomp
    add_rental(date, book_index, person_index)
    puts "\nRental successfully created"
  end

  def display_list_of_books
    puts "\n*- Books -*"
    @list_of_books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_list_of_people
    puts "\n*- People -*"
    @list_of_people.each_with_index do |person, index|
      puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def display_list_of_rentals(id)
    filter_list = @list_of_rentals.select { |rental| rental.person.id == id.to_i }
    puts "\n*- Rentals -*"
    filter_list.each_with_index do |rental, index|
      puts "#{index} - [#{rental.person.name}] Date: #{rental.date}, Book: #{rental.book.title}"
    end
  end

  def list_of_rentals_by_id
    puts "\n*- Rentals list by ID -*"
    print 'Do you want to see the list of people to check the ID [Y/N]: '
    list_people = gets.chomp.downcase
    display_list_of_people if list_people == 'y'
    print 'ID of person: '
    id = gets.chomp
    display_list_of_rentals(id)
  end
end
