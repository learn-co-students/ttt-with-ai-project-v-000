
module Players

  class Computer < Player
    def move(board)

        #first move for computer should be center [4], if not go to a corner
          if !board.taken?(5)
            comp_move = "5"
          elsif board.turn_count == 1
            move = "1"
          elsif board.turn_count ==2
            move = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
          elsif board.turn_count ==3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
            move = "2"
          end

    end
  end

end


# human first
# =>      load "config/environment.rb"
# =>      computer = Players::Computer.new("X")
# =>      human = Players::Human.new("0")
# =>      board = Board.new
# =>      computer_move = computer.move(board)
#          game = Game.new(human, computer)


#computer first
# =>      load "config/environment.rb"
# =>      computer = Players::Computer.new("X")
# =>      human = Players::Human.new("0")
# =>      board = Board.new
# =>      computer_move = computer.move(board)
#          game = Game.new(computer)
