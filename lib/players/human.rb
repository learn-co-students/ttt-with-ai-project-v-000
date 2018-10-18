module Players
  class Human < Player
    # move method

    attr_accessor :input

    def move(board)
      puts 'Please make a move by entering a number from 1 - 9.'
      gets.chomp
    end
  end
end
