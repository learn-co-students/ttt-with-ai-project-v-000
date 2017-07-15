module Players

class Computer < Player

  def move(token)
    # http://www.wikihow.com/Win-at-Tic-Tac-Toe
    valid_moves = (1..9).to_a.map {|i| i.to_s}

    # this throws an rspec error if the game is nil
    if self.token == self.game.current_player.token && board.cells == Array.new(9," ")
      self.first_player
    elsif self.token == self.game.current_player.token && board.cells.select {|c| c == "X"}.size == 1
      self.second_player
    else
      valid_moves.sample
    end

  end

  def first_player
    [1,3,7,9].sample
  end

  def second_player
    if board.taken?(board.cells[5])
      [1,3,7,9].sample
    else
      5
    end
  end

  def board
    self.game.board
  end

  end
end

  # Player belongs to Game
  # collaborating objects => need to call Game.new? or set the game property during game initialization?

  # first move
    # if computer is first (if player.token == "X" && board is empty)
      # take a corner - choose from [1,3,7,9]

    # if computer is second (if player.token == "O" && board has 1 spot filled)
      # is the center taken? false => move = 5
      # else take a corner - choose from [1,3,7,9]

  # block method
    # describe
      # it reads the board and finds the taken spots => spots = self.board.cells.each_with_index.map do |c| => if c == "O" || c == "X" => i 
        # if the opponent is occupying 2 of the winning combo spots then move to the third spot
          # iterate thru the winning combos and see if any of the occupied index match
            # get the index of the opponents positions
            # iterate thru the winning combos and see if any of them contain 2
        # if the user is occupying 2 of the winning combo spots then move to the third spot
        # if neither of those things are true, use some strategy to determine the next move
