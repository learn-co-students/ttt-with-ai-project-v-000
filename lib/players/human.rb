module Players
  class Human < Player
    attr_accessor :input

    def move(board)
    #  binding.pry
      @input = gets.chomp
    #  binding.pry
      @input
    end
  end
end
