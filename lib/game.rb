require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] != " "
        if @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[1]]== @board.cells[combination[2]]
           return combination
        end
      end
    end
    false
  end

  def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    win_combo = won?
     if win_combo
       if @board.cells[win_combo[0]] == " "
           nil
       else @board.cells[win_combo[0]]
       end
     end
  end

  def turn
    #binding.pry
    #puts "Your move #{current_player.token}"
    current_move = self.current_player.move(@board)
    until self.board.valid_move?(current_move)
      puts "Hey make a valid move #{current_player.token}"
      current_move = self.current_player.move(@board)
    end
    self.board.update(current_move, current_player)
    self.board.display

  end

  def play
        self.board.display
     until over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     else
       puts "Cats Game!"
     end


  end

WIN_COMBINATIONS= [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6]
]
end
