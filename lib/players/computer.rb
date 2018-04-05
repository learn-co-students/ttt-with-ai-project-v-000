module Players
  class Computer < Player

    attr_reader :token, :index, :name

    WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5],
  [6, 7, 8], [0, 4, 8],
  [2, 4, 6], [0, 3, 6],
  [1, 4, 7], [2, 5, 8],
  ]

    def initialize(token)
      @token = token
      @name = "Computer"
    end

    def move(board)
      cell_move = ""
      available_moves = []
      cell_move = for_the_win(board)
      if @block_moves == []
        board.cells.each_with_index do |cell, index|
          if cell == " "
            available_moves << (index + 1).to_s
          end
        end
        cell_move = available_moves.sample
      else
        cell_move = @block_moves.sample
      end
      cell_move
    end

    def for_the_win (board)
      @block_moves = []
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] != " "
          if board.cells[combo[1]] == self.token
            return (combo[2] + 1).to_s
          elsif board.cells[combo[2]] == " "
            @block_moves << (combo[2] + 1).to_s
          end #of if
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
          if board.cells[combo[2]] == self.token
            return (combo[1] + 1).to_s
          elsif board.cells[combo[1]] == " "
            @block_moves << (combo[1] + 1).to_s
          end #of if
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
          if board.cells[combo[2]] == self.token
            return (combo[0] + 1).to_s
          elsif board.cells[combo[0]] == " "
            @block_moves << (combo[0] + 1).to_s
          end #of if
        end # of if/elsif
      end #of do
      @block_moves
    end #of for_the_win
  end #of class
end #of move
