module Players
  class Human < Player
    attr_reader :move

    def move(board = "Optional")
      puts "Please make a move!"
      @move=gets
      @move
    end
  end
end
