require "pry"
require_relative "../../config/environment.rb"

class Human < Player

  def move(location)
    puts "Please enter 1 - 9"
    gets.strip
  end

end
