# module Players
#   class Computer < Player
#     def move(board)
#       move = nil
#
#       # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
#       if !board.taken?(5)
#         move = "5"
#
#       # If going second and the middle square is taken, take the upper-left corner square.
#       elsif board.turn_count == 1
#         move = "1"
#
#       # If you went first (and took the middle), take a corner square with your second move.
#       elsif board.turn_count == 2
#         move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
#
#       # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
#       elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
#         move = "2"
#
#       # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.
#       else
#         Game::WIN_COMBINATIONS.detect do |cmb|
#
#           # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
#           if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
#             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#
#           # If you can't play any winning moves, play a move to block the opponent from winning.
#           elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
#             move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
#           end
#         end
#
#         # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
#         move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
#       end
#       move
#     end
#
#   end
# end

class Player::Computer < Player
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

  def move(board, timer)
    @board = board
    timer <= 0 ? @timer = 0.01 : @timer = timer
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
    sleep(@timer)
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
