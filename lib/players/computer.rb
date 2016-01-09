require_relative "../player.rb" #the computer ai is controlled by how many open spaces are left, and what the computer should decide on, if nothing else, the computer chooses a random open square
require 'pry'
class Computer < Player
  def move (board) 
    puts "   #{@name}, What is your next move?" #not necessary, but fun to print the computers name
    puts "                                 " 
    empty_cell_count = board.cells.count {|cell|cell==" "} #counting the empty cells 
    if empty_cell_count==9 #the inital move if the computer has the first move, i am worried that these first few moves are hardcoded, there could, and may well be a failur of logic
      return ["1","3","7","9"].sample #randomly returns one of the corner moves
    elsif empty_cell_count==8 #if the computer is second to go, and the center square is available, it goes in the center, otherwise it takes a corner square
      if board.cells[4]==" "
        return "5"
      else
        return ["1","3","7","9"].sample
      end
    elsif board.near_win #checks for a near win scenario for themselves and the other side, if there is a near win scenario, it plays the last place to either win or block
      return board.near_win
    elsif empty_cell_count==6
      if board.cells[0]!=" " && board.cells[8]!=" " 
        return ["2","4","6","8"].sample
      elsif board.cells[2]!=" " && board.cells[6]!=" "
        return ["2","4","6","8"].sample
      elsif board.corner_and_mid
        return board.corner_and_mid
      elsif board.two_mid_adjacent
        return board.two_mid_adjacent
      end
    elsif empty_cell_count==4
      if board.mid_game_block
        return board.mid_game_block
      end
    end
    board.open_cells #if no near win scenario is available, it randomly calls one of the remaining squares
  end
end

