require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :winner

  def initialize( p1 = nil, p2 = nil, arena = nil)
    if arena
      @board = arena
    else
      @board = Board.new
    end

    if p1
      @player_1 = p1
    else
      @player_1 = Human.new("X")
    end

    if p2
      @player_2 = p2
    else
      @player_2 = Human.new("O")
    end

  end

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

  # current_player assumes that the first player was "X"
  # it uses Board's #turn_count to calculate whose turn it is.
  def current_player
    num_moves = self.board.turn_count
    num_moves % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS
      if self.board.taken?(combination[0] + 1) #only check for a win if the position is taken
        if self.board.cells[combination[0]] == self.board.cells[combination[1]] && self.board.cells[combination[0]] == self.board.cells[combination[2]]
          self.winning_token = self.board.cells[combination[0]] # records the token of the winner
          return true
        end
      end
    end
    false
  end

  def draw?
    self.board.full? && !self.won?
  end

  ####### setter and getter for winning_token
  def winning_token=(token)
    @winning_token = token
  end

  def winning_token
    @winning_token
  end
  #######

  # **OPTIONAL** #winning_player returns the Player object of the winner as found by #won?
  def winning_player
    if self.won?
      return player_1 if player_1.token == self.winning_token
      return player_2 if player_2.token == self.winning_token
      return nil # if no winner
    end
  end

  # #winner returns the token of the winning player, as found by #won?
  def winner
    self.won? ? winning_token : nil
  end

  # Ask the player for a position and update the board if it's a valid move?
  def turn
    puts "It is #{self.current_player.token}'s turn"
    position_requested = self.current_player.move(self.board)
    if self.board.valid_move?(position_requested)
      self.board.update(position_requested, self.current_player)
      # self.current_player.increment_turn_count  # increment_turn_count on player!!!
    else
      puts "invalid move, try again."
    end
  end

  def play
    while true
      puts ""
      puts "The board looks like this\n\n"
      self.board.display
      puts "***********************"
      puts "Valid moves are #{self.board.valid_moves}"
      # do the checks first (partly in order to pass spec's)
      if self.over? || self.won? || self.draw?
        if self.won?
          #congrats
          puts "Congratulations #{self.winner}!"
          return nil
        else
          # it was a draw
          puts "Cats Game!"
          return nil
        end
      end
      self.turn # Important! This is where a "turn" is taken.
    end
    return nil
  end

end
