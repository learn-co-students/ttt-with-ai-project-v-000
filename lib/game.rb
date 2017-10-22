require 'pry'
class Game
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #returns current person who's playing, but yet to move
    if self.board.turn_count.even?
      @player_1
    elsif self.board.turn_count.odd?
      @player_2
    end
  end

  def won? #returns true or false
    WIN_COMBINATIONS.detect do | win_combination |
         (self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X")||
         (self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O")
        end
  end

  def draw?
    self.board.full? && !won?

  end

  def over? #if game is over, returns true
    draw? || won?
  end

  def winner #returns X or O
    if won?
      self.board.cells[won?[0]]
    end
  end

  def turn #calls once, returns value of input and makes move and switches players, or if move is invalid, runs through again
    #Current player makes a move with their token. Token is place on the board.

      moving = current_player.move(@board) #returns user_input
      if @board.valid_move?(moving)
        @board.update(moving, current_player)

      elsif !@board.valid_move?(moving)
        turn
      end
    end

  def play #primarily for bin
    while !over?
      self.turn
      @board.display
    end

    case winner
    when "X"
      puts "Congratulations X!"
    when "O"
      puts "Congratulations O!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end

end
