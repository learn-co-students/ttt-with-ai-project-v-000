class Players
  class Computer < Player
    attr_accessor :name

    #STOP_COMBINATIONS = [[0,1], [1,2], [3,4], [4,5], [6,7], [7,8], [0,3], [1, 4], [2, 5], [3,6], [4,7], [5,8], [0,4], [4,8], [2,4], [4,6]]

    def move(board)
      move = ""
      if board.cells[4] == " "
        return "5"
      end
      Game::WIN_COMBINATIONS.each do |combination|
        if (board.cells[combination[0]] == board.cells[combination[1]])
          move = (combination[2] + 1).to_s unless board.cells[combination[0]] == " " || !board.valid_move?((combination[2] + 1).to_s)
          #binding.pry
        elsif (board.cells[combination[0]] == board.cells[combination[2]])
          move = (combination[1] +1).to_s unless board.cells[combination[0]] == " " || !board.valid_move?((combination[1] + 1).to_s)
        end
      end
      if move == ""
        if board.cells[2] = " "
          move = "3"
        elsif board.cells[6] = " "
          move = "7"
        elsif board.call[8] = " "
          move = "9"
        end
      end
      if move == ""
        board_array = []
        board.cells.each_with_index do |cell, i|
          if cell == " "
            board_array << i + 1
          end
        end
        move = board_array[0].to_s
      end
      move
    #  binding.pry
    end
  end
end
