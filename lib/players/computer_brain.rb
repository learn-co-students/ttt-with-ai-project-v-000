# The 'AI' used in this class bagan as a straight implementation of an approach
# provided by "John Kes, Aerospace Materials Engineer" in his post on the following thread:
# https://www.quora.com/Is-there-a-way-to-never-lose-at-Tic-Tac-Toe.
# Here's psuedo code for John's approach:
#
# Assign values for the positions, based on how many ways that position can be used to win:
#     center = 4
#     corner = 3
#     sides = 2
#
# Always pick the position with the highest value, while looking out for your opponent's
# positions and your possible winning positions. => you will never lose.
#
# Playing against this 'AI' my wife quickly found she could win by going first and picking
# a corner.  John's algorithm would then pick the center, since its available, and a loss 
# for the computer is certain.  I solved this by adding logic t also pick a corner on the 
# second move if the computer has picked a corner on the first move.
#
# I believe this improved version is truly unbeatable
#
class ComputerBrain
  
  WINS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  CENTERS = [4]
  CORNERS = [0,2,6,8]
  SIDES = [1,3,5,7]  
  
  def move (board)
    
    if (m = find_winning_move(board))
      return m
    end
    
    if (m = find_blocking_move(board))
      return m
    end
    
    if (m = find_second_move_move(board))
      return m
    end
    
    if (m = find_center_move(board))
      return m
    end
    
    if (m = find_corner_move(board))
      return m
    end
    
    if (m = find_side_move(board))
      return m
    end
    
  end
  
  #private
  
  def find_winning_move(board)
    find_two_of_three_taken_move(board, my_token(board))
  end
  
  def find_blocking_move(board)
    find_two_of_three_taken_move(board, foe_token(board))
  end
  
  def find_second_move_move(board)
    second_move?(board) ? find_corner_move(board) : nil
  end
  
  def find_center_move(board)
    find_move(board, CENTERS)
  end
  
  def find_corner_move(board)
    find_move(board, CORNERS)
  end
  
  def find_side_move(board)
    find_move(board, SIDES)
  end

  #utilities
  
  def find_move(board, category)
    to_pos(category.find { |i| board.cells[i] == " " })
  end
  
  def find_two_of_three_taken_move(board, token)
    combo = WINS.find { |e| near_win?(board, e, token) }
    combo.nil? ? nil : to_pos(combo.find { |e| board.cells[e] == " " })
  end
  
  def near_win?(board, combo, token)
    combo.find_all { |i| board.cells[i] == token }.size == 2 &&
    combo.find_all { |i| board.cells[i] == " " }.size == 1
  end
  
  def to_pos(index)
    index.nil? ? nil : (index + 1).to_s
  end
  
  def foe_token(board)
    board.cells.find_all {|t| t == "X" || t == "O"}.size.even? ? "O" : "X"
  end
  
  def my_token(board)
    foe_token(board) == "X" ? "O" : "X"
  end
  
  def second_move?(board)
    board.cells.find_all {|t| t == "X" || t == "O"}.size == 1 
  end
  
end