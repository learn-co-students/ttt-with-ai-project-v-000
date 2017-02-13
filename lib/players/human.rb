require "pry"
module Players
  class Human < Player
    def move(board)
      puts "Please make your move, choices are 1-9 going from left to right on the board"
      board.display

      input = gets.strip
      input

    end

  end

end
