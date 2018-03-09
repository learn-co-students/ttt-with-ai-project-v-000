require 'pry'

class Game < Player

  attr_accessor :board

  attr_reader :player_1, :player_2

  WIN_COMBINATIONS = [[2,5,8], [0,1,2], [3,4,5], [6,7,8], [1,4,7], [0,3,6], [0,4,8], [6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board=(board)
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && self.board.taken?(board.cells[combo[0]])
    end #detect iteration
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == "X" && self.board.taken?(board.cells[combo[0]])
          return "X"
        elsif board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == "O" && self.board.taken?(board.cells[combo[0]])
          return "O"
        end #if statement
    end #detect iteration
  end

  def turn
    player = self.current_player
    board_position = self.current_player.move(board)
    if !self.board.valid_move?(board_position)
      turn
    else
      self.board.update(board_position, player)
    end
  end

  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end


  def player_1=(player_1)
    @player_1 = player_1
  end

  def player_2=(player_2)
    @player_2 = player_2
  end

end
