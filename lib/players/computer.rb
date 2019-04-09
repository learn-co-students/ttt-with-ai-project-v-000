module Players
  class Computer < Player
    #returns a valid position for the computer to move
    def move(board)
      puts "My turn! I'm #{token}"
      #binding.pry
      if board.cells[4] == " "
        '5'
      elsif board.cells[4] != " " && board.cells[0] == " "
        '1'
      elsif board.cells[4] != " " && board.cells[0] != " " && board.cells[8] == " "
        '9'
      else
        computer_move = rand(1..9).to_s
        if board.valid_move?(computer_move)
          computer_move
        end
      end #AI strategy
    end #method
  end #class
end #module

=begin
      if board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        '5'
      elsif board.cells == [" ", " ", " ", " ", "X", " ", " ", " ", " "] || [" ", " ", " ", " ", "O", " ", " ", " ", " "]
        '1'
      else
        computer_move = rand(1..9).to_s
        if board.valid_move?(computer_move)
          computer_move
        end
      end
=end
=begin
computer_move = rand(1..9).to_s
if board.valid_move?(computer_move)
  computer_move
end
=end
