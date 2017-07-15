module Players

class Computer < Player
  attr_accessor :last

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def move(token)
    # http://www.wikihow.com/Win-at-Tic-Tac-Toe
    valid_moves = (1..9).to_a.map {|i| i.to_s}
    # binding.pry
    # this throws an rspec error if the game is nil
    # break into 2 modes - if first player or if second player

    # first player logic

    # when the computer plays itself they both go to the corners...?
    if self.game.player_1 == self
      if board.turn_count == 0
        self.last = self.first_player
      elsif board.turn_count == 2
        self.last = self.second_move
       elsif self.board.turn_count >= 4
        self.last = self.win || self.block
      else
        self.last = valid_moves.sample
      end
    # second player logic
    elsif self.game.player_2 == self
      if board.turn_count == 1
        self.last = self.second_player
      # when it gets to the 3rd move it doesn't block, it goes for the corner
      elsif board.turn_count == 3
        self.last = self.block
      # the second player needs to check for a block when turn_count == 3
      else
        self.last = valid_moves.sample
      end
    end


  #   if self.token == self.game.current_player.token && board.cells == Array.new(9," ")
  #     self.last = self.first_player
  #   elsif self.token == self.game.current_player.token && board.turn_count == 1
  #     self.last = self.second_player
  #   elsif board.turn_count == 2 || board.turn_count == 3
  #     self.last = self.second_move
  #   elsif board.turn_count >= 3
  #     # self.last = self.block || self.last = valid_moves.sample
  #   end
  #
  end

  def board
    self.game.board
  end

  def first_player
    [1,3,7,9].sample
  end

  def second_player
    board.taken?(board.cells[5]) ? [1,3,7,9].sample : 5
  end

  def second_move
    # if they went in the center, then you go to the corner opposite the one you picked first
    # opposite corners
      # 1 => 3 or 7
      # 3 => 1 or 9
      # 7 => 1 or 9
      # 9 => 3 or 7
    if self.last == 1
      self.last = [3,7].sample
    elsif self.last == 3
      self.last = [1,9].sample
    elsif self.last == 7
      self.last = [1,9].sample
    elsif self.last == 9
      self.last = [3,7].sample
    end
    self.last
  end

  def block
    # if the opponent occupies 2 out of 3 spots of a winning combo then you need to go in the 3rd spot
    block = nil
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] != self.token && board.cells[combo[1]] != self.token) && board.cells[combo[2]] == " "
        block = combo[2]+1
      elsif (board.cells[combo[1]] != self.token && board.cells[combo[2]] != self.token) && board.cells[combo[0]] == " "
        block = combo[0]+1
      elsif (board.cells[combo[0]] != self.token && board.cells[combo[2]] != self.token) && board.cells[combo[1]] == " "
        block = combo[1]+1
      end
    end
    block
  end

  def win
    win = nil
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) && board.cells[combo[2]] == " "
        win = combo[2]+1
      elsif (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[0]] == " "
        win = combo[0]+1
      elsif (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[1]] == " "
        win = combo[1]+1
      end
    end
    win
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
  # should the computer remember it's last move?
  # block method
    # describe
      # it reads the board and finds the taken spots => spots = self.board.cells.each_with_index.map do |c| => if c == "O" || c == "X" => i
        # if the opponent is occupying 2 of the winning combo spots then move to the third spot
          # iterate thru the winning combos and see if any of the occupied index match
              # combo[0] && combo[1] or combo[1] && combo[2] or combo[0] && combo[2]
              # get the index of the opponents positions
              # any of those pairs != self.token
            # iterate thru the winning combos and see if any of them contain 2
        # if the user is occupying 2 of the winning combo spots then move to the third spot
        # if neither of those things are true, use some strategy to determine the next move
