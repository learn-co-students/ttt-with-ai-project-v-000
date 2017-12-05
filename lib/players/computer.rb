module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8],
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [6,4,2]
    ]

    def move(board)
      if middle_available?(board)
        "5"

        #offense
      elsif you_can_score?(board)
        score(board)

        #defense
      elsif opponent_can_score?(board)
        block(board)

        #fill up three
      elsif diagonal_open?(board)
        fill_diagonal(board)
        
        #go to corner
      elsif corner_available?(board)
        [1,3,7,9].sample

        #go to edge
      else
        [2,4,6,8].sample
      end
    end

    def middle_available?(board)
      board.cells[4] == " "
    end

    def you_can_score?(board)
      WIN_COMBINATIONS.any? do |combo|
        (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ") || 
        (board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.cells[combo[0]] == " ") ||
        (board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " ")
      end
    end

    def score(board)
      temp = Array.new(WIN_COMBINATIONS)
      temp.collect! do |combo|
        if board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " "
          combo[2] + 1
        elsif board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.cells[combo[0]] == " "
          combo[0] + 1
        elsif board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " "
          combo[1] + 1
        end
      end
      temp.compact.first
    end

    def opponent_can_score?(board)
      WIN_COMBINATIONS.any? do |combo|
        (board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == " ") || 
        (board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token && board.cells[combo[0]] == " ") ||
        (board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token && board.cells[combo[1]] == " ")
      end
    end

    def block(board)
      temp = Array.new(WIN_COMBINATIONS)
      temp.collect! do |combo|
        if board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == " "
          combo[2] + 1
        elsif board.cells[combo[1]] == opponent_token && board.cells[combo[2]] == opponent_token && board.cells[combo[0]] == " "
          combo[0] + 1
        elsif board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == opponent_token && board.cells[combo[1]] == " "
          combo[1] + 1
        end
      end
      temp.compact.first
    end

    def diagonal_open?(board)
      [[0,4,8],[6,4,2]].any? do |combo|
        (board.cells[combo[0]] != " " && board.cells[combo[1]] != " " && board.cells[combo[2]] == " ") || 
        (board.cells[combo[1]] != " " && board.cells[combo[2]] != " " && board.cells[combo[0]] == " ") ||
        (board.cells[combo[0]] != " " && board.cells[combo[2]] != " " && board.cells[combo[1]] == " ")
      end
    end

    def fill_diagonal(board)
      temp = [[0,4,8],[6,4,2]]
      temp.collect! do |combo|
        if board.cells[combo[0]] != " " && board.cells[combo[1]] != " " && board.cells[combo[2]] == " "
          combo[2] + 1
        elsif board.cells[combo[1]] != " " && board.cells[combo[2]] != " " && board.cells[combo[0]] == " "
          combo[0] + 1
        elsif board.cells[combo[0]] != " " && board.cells[combo[2]] != " " && board.cells[combo[1]] == " "
          combo[1] + 1
        end
      end
      temp.compact.first
    end

    def corner_available?(board)
      board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " " 
    end

    def opponent_token
      if token == "X"
        "O"
      else
        "X"
      end
    end
  end
end