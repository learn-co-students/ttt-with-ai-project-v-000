class Game

  attr_accessor :board, :player_1, :player_2, :current_player

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    (self.won? || self.draw?) ? true : false
  end

  def won?
    #1) Look at the indexes in each "win combinations" combo.
    win_combo = nil
    WIN_COMBINATIONS.each do |combo|
      pos_1 = board.cells[combo[0]]
      pos_2 = board.cells[combo[1]]
      pos_3 = board.cells[combo[2]]

      #2) Change status to "true" if all 3 spots are occupied by the same token.
      if (pos_1 == pos_2 && pos_2 == pos_3) && (pos_1 == "X" || pos_1 == "O")
        win_combo = combo
        break #ends loop (to avoid returning from inside of loop)
      end
    end
    win_combo
  end

  def draw?
    self.board.full? && !self.won? ? true : false
  end

  def winner
    # Returns the token whichever player won.
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def change_player #returns the player whose turn it will be next
    if self.current_player == self.player_1
      self.current_player = self.player_2
    else
      self.current_player = self.player_1
    end
  end


  def turn #executes a turn and then changes the player.
    player_move = self.current_player.move(self.board.cells)
    if player_move == "exit"
      exit
    else
      until !!self.board.valid_move?(player_move)
        puts "invalid"
        player_move = self.current_player.move(self.board.cells)
      end
    end

    self.board.update(player_move,current_player) #updates board with your valid move

    self.change_player

  end

  def play #executes the entire process of playing a game.
    until self.over?
      self.board.display
      self.turn
    end

    if self.winner
      self.board.display
      puts "Congratulations #{self.winner}!"
    else
      self.board.display
      puts "Cat's Game!"
      return "Cat's Game!"

    end

  end

end
