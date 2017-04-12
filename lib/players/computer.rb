require_relative "../player.rb"
module Players
  class Computer < Player
    attr_accessor :board
    def move(board)
      @board = board
      move = self.smart_choices.to_s
    end

    def smart_choices
      turn = self.board.turn_count
      case turn
      when 0
          5
      when 1
        corners = [1,3,7,9]
        index = rand(0..3)
        corners[index]
      when 2
        corners = [1,3,7,9]
        index = rand(0..3)
        corners[index]
      else
        rand(1..9)
      end


    end
  end

end
