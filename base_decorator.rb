require './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  # @param [Component] component
  def initialize(nameable)
    @nameable = nameable
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @nameable.correct_name
  end
end
