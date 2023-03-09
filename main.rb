require_relative './app'

def main
  app = App.new
  loop do
    menu_list()
    list_option(app)
  end
end

def menu_list
  puts "\n*- School library -*"
  puts "\n1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all rental for a given person id"
  puts "7 - Exit"
end

def list_option(app)
  option = gets.chomp
  case option
  when '1'
    app.display_list_of_books
  when '2'
    app.display_list_of_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_of_rentals_by_id
  when '7'
    exit_app()
  end
end

def exit_app
  puts "\nThank for using the app, have a nice day!"
  exit()
end

main()