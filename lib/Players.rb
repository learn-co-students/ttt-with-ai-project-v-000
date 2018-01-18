require 'pry'
class Players
  class Human < Player
    def move(board)
      print "Put num: "
      gets.chomp
    end#move
  end#human

  class Computer < Player
    attr_accessor :available_moves, :board

    def move(board)
      @board = board
      sleep(1)
      (self.strategy+1).to_s
    end#move

    def search_moves
      self.available_moves = []
      self.board.cells.each_with_index do |val,index|
        self.available_moves << index if val == " "
      end
    end

    def strategy
      search_moves
      if self.board.turn_count <= 3 && self.available_moves.include?(4)
        4
      else
        available_moves.sample
      end
    end
  end
end
