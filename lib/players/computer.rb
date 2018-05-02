require 'pry'
module Players
  class Computer < Player
    i = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    def move(board)
    move = nil
    
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        corners = [1, 3, 7, 9]
        corners.detect do |space|
          !board.taken?(space)
          space.to_s
        end
      elsif board.turn_count == 3 && board.position(1) == board.position(9) || board.position(3) == board.position(7)
        side_squares = ["2", "4", "6", "8"]
        rando = Random.new
        move = side_squares[rando.rand(0..3)]
      end
    end
  end
end