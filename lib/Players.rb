require 'pry'
class Players
  class Human < Player
    def move(board)
      gets.chomp
    end
  end

  class Computer < Player
    attr_accessor :available_moves, :pos_taken, :board

    def move(board)
      board.turn_count <= 5 ? Random.rand(0..9).to_s : self.strategy
    end

    def search_moves
      self.available_moves = []
      self.pos_taken = []
      self.board.cells.each.with_index do |val,index|
        if val == " "
          self.available_moves << index
        elsif val == self.token
          self.pos_taken << index
        end
      end
    end

    def strategy
      self.board.WIN_COMBINATIONS.each do |win_combination|
        win_combination.detect.with_index do |x,i|
          x == self.token && self.available_moves.include?(x)
        end
      end
    end
  end

end
