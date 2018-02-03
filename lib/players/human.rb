module Players
  class Human < Player
    # attr_accessor
    # def initialize
    #
    # end

    def move(board)
      puts "Please enter your move, 1-9: "
      input = gets.chomp
    end

  end
end
