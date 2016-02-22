require "pry"
class Player::Computer < Player

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

  def move(board)
    minimax = []
    num = (1..9).to_a.shuffle
    num.each do |i|
      if board.valid_move?(i)
        if self.token == "X"
          if won?(board) == "X"
            minimax << {move: i, score: 1}
          elsif draw?(board)
            minimax << {move: i, score: 0}
          else
            minimax << {move: i, score: -1}
          end
        elsif self.token == "O"
          if won?(board) == "O"
            minimax << {move: i, score: -1}
          elsif draw?(board)
            minimax << {move: i, score: 0}
          else
            minimax << {move: i, score: 1}
          end
        end
      end
    end
    minimax.max { |a, b| a[:score] <=> b[:score] }[:move].to_s
  end

  def won?(board)
      WIN_COMBINATIONS.any? do |arr|
        win_index_1 = arr[0]
        win_index_2 = arr[1]
        win_index_3 = arr[2]
        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X" || 
          position_1 == "O" && position_2 == "O" && position_3 == "O"
          self.token
        else
          false
        end
      end
  end

  def draw?(board)
    if !(won?(board)) && board.full?
      true
    elsif !won?(board) && !board.full?
      false
    elsif won?(board)
      false
    end
  end

end
