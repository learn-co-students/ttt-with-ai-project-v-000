class Player::Computer < Player
  attr_reader :token
  def initialize(token)
    @first_moves = [5,1,3,7,9]
    @priority_moves = [5,1,3,7,9,2,4,6,8]
    @next_move = nil
    @token = token
    if @token == "X"
      @enemy = "O"
    else
      @enemy = "X"
    end
  end

  def move(board)

    Game::WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == @enemy && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
        @priority_moves.unshift(combo[2]+1)
      elsif board.cells[combo[0]] == @enemy && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
        @priority_moves.unshift(combo[1]+1)
      elsif board.cells[combo[1]] == @enemy && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
        @priority_moves.unshift(combo[0]+1)
      end
    end

    Game::WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == @token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
        @priority_moves.unshift(combo[2]+1)
      elsif board.cells[combo[0]] == @token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
        @priority_moves.unshift(combo[1]+1)
      elsif board.cells[combo[1]] == @token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
        @priority_moves.unshift(combo[0]+1)
      end
    end
    
    if board.turn_count == 1
      @priority_moves.unshift(@first_moves.sample)
    end

    @next_move = @priority_moves.detect do |item|
      !board.taken?(item)
    end

    "#{@next_move}"

  end

end
