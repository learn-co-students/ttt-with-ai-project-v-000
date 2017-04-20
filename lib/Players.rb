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
      @board = board   #we can access to this board in any function with self.board_Niki
      board.turn_count <=5 ? Random.rand(0..9) : self.strategy
    end
 # maybe it would be better to divide this function (strategy -> search_moves + strategy)_Niki
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
          x[0] == self.token && self.token == x[1] && self.available_moves.include?(i)
        end
      end
    end
        #i want to use the WIN_COMBINATIONS array to detect our next best move to win.
        #checking if the token is occupying two out of three winning spots, and hopefully returning the move

        #I think we should use yield twice because the WIN_COMBINATIONS is nested array. However, the IDEA is GREAT! _Niki
  end
end
