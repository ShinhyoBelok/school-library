require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
