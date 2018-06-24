module Players

  class Human < Player
    attr_accessor :input

    def move(board)
      puts "Enter move:"
      @input = gets.strip
    end


  end
end
