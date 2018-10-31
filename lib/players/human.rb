require_relative '../../config/environment.rb'

module Players

  class Human < Player

    def move(input)
      gets.chomp
    end

  end
end
