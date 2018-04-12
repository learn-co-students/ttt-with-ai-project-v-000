module Players
  class Computer < Player

    attr_reader :token, :index, :name

    def initialize(token)
      @token = token
      @name = "Computer"
    end

    def move(board)
      if !board.taken?(5)
        this_move = "5"
      elsif board.turn_count == 1
        this_move = "1"
      elsif board.turn_count == 2
        this_move = [1, 3, 7, 9].detect{|square| !board.taken?(square)}.to_s
      elsif board.turn_count == 3
        if board.cells[0] == board.cells[8] || board.cells[2] == board.cells[6]
          this_move = "2"
        else
          this_move = for_the_win(board)[0]
          this_move
        end
      elsif board.turn_count > 3
          this_move = for_the_win(board)[0]
          this_move
      end
      until !board.taken?(this_move)
        move(board)
      end
      this_move
    end

    def for_the_win (board)
      @block_moves = []
      Game::WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] != " "
          if !board.taken?(combo[2] + 1)
            return (combo[2] + 1).to_s
          end # if
        end # of combo check
        if board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
          if !board.taken?(combo[1] + 1)
          return (combo[1] + 1).to_s
          end #of if
        end
        if board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[2]] != " "
          if !board.taken?(combo[0] + 1)
            return (combo[0] + 1).to_s
          end #of if
        end #of combo check
      end #of do

      empty_cells(board)

    end #of for_the_win

    def empty_cells(board)
      left_over = []
      [2, 3, 4, 6, 7, 8, 9].each do |num|
        if !board.taken?(num)
          left_over << num
        end #of if
      end#of do
      @block_moves = left_over.sample.to_s
      @block_moves
    end #of empty_cells
    
  end #of class
end #of module
