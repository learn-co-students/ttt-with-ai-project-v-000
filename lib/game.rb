require 'pry'
class Game
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
attr_accessor :player_1, :player_2, :board, :position

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #returns current person who's playing, but yet to move
    if self.board.turn_count.even?
      self.player_1
    elsif self.board.turn_count.odd?
      self.player_2
    end
  end

  def won? #returns true or false
    WIN_COMBINATIONS.detect do | win_combination |
         (self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X")||
         (self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O")
        end
  end

  def draw?
    if self.board.full? && self.won? == nil
      true
    else
      false
    end
  end

  def over? #if game is over, returns true
    if self.draw? || self.won?
      true
    else
      false
    end
  end

  def winner #returns X or O
    if self.won? != nil
      self.board.cells[self.won?[0]]
    end
  end

  def turn #calls once, returns value of input and makes move and switches players, or if move is invalid, runs through again
    #Current player makes a move with their token. Token is place on the board.
      moving = self.current_player.move(self.board.cells) #returns user_input and moves token to board
      if self.board.valid_move?(moving) && !self.over?
        #if the game is over, and this is true, it becomes false. If the game is not over, and it is false, this becomes true
        moving
        self.board.update(moving, self.current_player)
        self.board.display #updates the board
      else
        puts "invalid"
        self.turn
      end
      self.board.turn_count
      self.current_player
  end

  def play
    while !self.over?
      self.turn
    end

    case self.winner
    when "X"
      puts "Congratulations X!"
    when "O"
      puts "Congratulations O!"
    end

    if self.draw?
      puts "Cat's Game!"
    end
  end

end
