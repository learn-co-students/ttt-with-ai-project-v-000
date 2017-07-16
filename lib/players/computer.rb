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

  def move(board)
    valid_moves = (1..9).to_a.map {|i| i.to_s}

    if self.game == nil
      #if there's no valid game, it will still return a valid board move
      self.last = valid_moves.sample
    # first player logic
    elsif self.game.player_1 == self
      if self.turn_count == 0
        self.last = self.first_player
        # [1,3,7,9].sample #when i try to use a method here it causes it not to block properly
      elsif self.turn_count == 2
        self.last = self.second_move
      elsif self.turn_count == 4
        self.last = self.win || self.last = self.block || self.last = self.other
      elsif self.turn_count > 4
        self.last = self.block || self.last = self.win || self.last = self.other
      end
    # second player logic
    elsif self.game.player_2 == self
      if self.turn_count == 1
        self.last = self.second_player
        # self.board.taken?(5) ? [1,3,7,9].sample : 5
      # when it gets to the 3rd move it doesn't block, it goes for the corner
      elsif self.turn_count == 3
        self.last = self.block
      elsif self.turn_count > 4
        self.last = self.block || self.last = self.win || self.last = self.other
      end
    end

    # if self.game == nil
    #   self.last = valid_moves.sample
    # elsif self.board.turn_count == 0
    #   self.last = self.first_player
    # elsif self.board.turn_count == 1
    #   self.last = self.second_player
    # elsif self.board.turn_count == 2
    #   self.last = self.second_move
    # else #self.board.turn_count >= 3
    #   if self.win
    #     self.last = self.win
    #   elsif self.block
    #     self.last = self.block
    #   else
    #     self.last = valid_moves.sample
    #   end
    # end
    # self.last

  #   if self.token == self.game.current_player.token && board.cells == Array.new(9," ")
  #     self.last = self.first_player
  #   elsif self.token == self.game.current_player.token && board.turn_count == 1
  #     self.last = self.second_player
  #   elsif board.turn_count == 2 || board.turn_count == 3
  #     self.last = self.second_move
  #   elsif board.turn_count >= 3
  #     # self.last = self.block || self.last = valid_moves.sample
  #   end
    self.last
  end

  def board
    self.game.board
  end

  def turn_count
    self.game.board.turn_count
  end

  def first_player
    [1,3,7,9].sample
  end

  def second_player
    self.board.taken?(5) ? [1,3,7,9].sample : 5
  end

  def second_move
    # if they went in the center, then you go to the corner opposite the one you picked first
    # opposite corners
      # 1 => 3 or 7
      # 3 => 1 or 9
      # 7 => 1 or 9
      # 9 => 3 or 7
    if !self.board.taken?(5)
      self.last = 5
    elsif self.last == 1
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
    # if the opponent is in 2/3 spots of a winning combo then you go in the empty spot
    block = nil
    WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && board.cells[combo[2]] == " "
        block = combo[2]+1
      elsif (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.cells[combo[0]] == " "
        block = combo[0]+1
      elsif (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.cells[combo[1]] == " "
        block = combo[1]+1
      end
    end
    block
  end

  def win
    win = nil
    WIN_COMBINATIONS.detect do |combo|
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

  def other
    [1,3,7,9,2,4,6,8].detect {|i| self.board.cells[i-1] == " "}
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
