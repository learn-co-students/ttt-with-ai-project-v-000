require 'pry'
module Players
class Computer < Player
  attr_accessor :board
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  CORNERS = [0, 2, 8, 6]

  def move(board)
    @board = board
    
    case
      when winning_move != nil
        input = winning_move + 1
      when blocking_move != nil
        input = blocking_move + 1
      when center?
        input = 5
      when opposite_corner != nil && board.taken?(opposite_corner) == false
        input = opposite_corner
      when corner
        input = corner + 1
      else
        until !board.taken?(input)
          input = (1..9).to_a.sample
        end
    end
    input.to_s
  end
  
  def other
    token == "X" ? "O" : "X"
  end
  
  def winning_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ") || (board.cells[combo[2]] == token && board.cells[combo[1]] == token && board.cells[combo[0]] == " ") || (board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " ")
    end
    if winning_row != nil
      winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
    end
  end
  
  def blocking_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == other && board.cells[combo[1]] == other && board.cells[combo[2]] == " ") || (board.cells[combo[1]] == other && board.cells[combo[2]] == other && board.cells[combo[0]] == " ") || (board.cells[combo[2]] == other && board.cells[combo[0]] == other && board.cells[combo[1]] == " ")
    end
    if winning_row != nil
      winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
    end
  end
  
  def center?
    board.cells[4] == " "
  end
  
  def corners
    CORNERS.shuffle!
  end
  
  def corner
    corners.find {|corner| board.cells[corner] == " "}
  end
  
  def opposite_corner
    case
      when board.taken?(1) && !board.taken?(9)
        9
      when board.taken?(9) && !board.taken?(1)
        1
      when board.taken?(3) && !board.taken?(7)
        7
      when board.taken?(7) && !board.taken?(3)
        3
      else
        nil
    end
  end
end
end 
# module Players

#   class Computer < Player
#     # WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [2,4,6]]

#     def move(board)
#       if !board.taken?("5")
#         return "5"
#       else 
#         rerun(board)
#       end 
#     end
      
#     def rerun(board)
#       u = board.cells.each_index.select {|i| board.cells[i] == " "}
#       u.sample
      
#     end 
      
      
   
    
#     def winnable
#       u = board.cells.each_index.select {|i| board.cells[i] == " "}
#       #iterate through win combos and determine if any spots are taken by the opponent
#       #determine all spots where opponent is and remove all combos with that position
#       u.sample
#     end 
    
#     def other
#       if self.token == "X"
#         other = "O"
#       else
#         other = "X"
#       end
#     end 
      
#     def opponent_win?
#       set players
#         b = board.cells.each_index.select {|i| board.cells[i] == other}
#         # x = WIN_COMBINATIONS.reject {|combo| combo.include?(s)}
#         # array1 & array2 
#         #(b & WIN_COMBINATIONS[0]).size == 2
#         # this gives me the missing cell for win combo (WIN_COMBINATIONS[0] - b)
#         # WIN_COMBINATIONS.select {|combo| b.each {|c| combo & c}}
#         # this finds empty slots to play on board- board.cells.each_index.select {|i| board.cells[i] == " "}
    
#     end

#     def almost_won?
#       WIN_COMBINATIONS.select do |combo|
#       board.cells[combo[0]] == board.cells[combo[1]] ||
#       board.cells[combo[1]] == board.cells[combo[2]] || board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
#       end
#     end
  
#   end
# end
