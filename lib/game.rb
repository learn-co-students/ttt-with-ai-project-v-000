require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1 
  end
  
  def won?
    winner = ""
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"}
        winner = combo
      end
    end
    winner != "" ? winner : FALSE
  end

  def draw?
    if won? == false
      @board.full? ? true : false
    else
      false
    end
  end
  
  def over?
    draw? == true || won? != false ? true : false
  end
  
  def winner
    won? ? @board.cells[won?[0]] : nil
  end
  
  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end

  def play
    if over?
      case
      when won? != false
        puts "Congratulations #{winner}!"
      when draw?
        puts "Cat's Game!"
      end
    else
      turn
      @board.display
      play
    end
  end
    
end