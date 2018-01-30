require 'pry'

module Players

  class Computer < Player

    def move(input)
      #binding.pry
      input.cells.rindex(" ").to_s
    end

  end

end
