require "pry"
class Player::Computer < Player
  # attr_accessor :best_move

  # def move(board)
  #   binding.pry
  # end

  # def minimax(board, game)
  #   minimax = {move: [], score: []}
  #
  #   (1..9).each do |i|
  #     if board.valid_move?(i)
  #       if game.won?
  #        minimax[:move] << i
  #        minimax[:score] << 1
  #       elsif game.draw?
  #        minimax[:move] << i
  #        minimax[:score] << 0
  #       else
  #         minimax[:move] << i
  #        minimax[:score] << -1
  #       end
  #     end
  #   end
  #   
  #   #returns the index of the max value inside the :score array
  #   max_value = minimax[:score].index(minimax[:score].max)
  #   #assigns @best_move using max_value index and :move array.
  #   @best_move = minimax[:move][max_value]
  # end

  # def move(board)
  #   position = rand(1..9).to_s
  #   until !board.taken?(position)
  #     position = rand(1..9).to_s
  #   end
  #   position
  # end
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
    (1..9).each do |i|
      if board.valid_move?(i)
        if self.token == "X"
          if won?(board)
            minimax << {move: i, score: 1}
          elsif draw?(board)
            minimax << {move: i, score: 0}
          else
            minimax << {move: i, score: -1}
          end
        end
      end
    end
    minimax.max_by {|k, v| v}[:move].to_s
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
         return arr
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
