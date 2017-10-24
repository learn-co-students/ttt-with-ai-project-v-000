class Game
  require 'pry'

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5,],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 == 0
       @player_1
    else
      @player_2
    end
  end

  def over?
  self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.each do |game|
    win_1 = game[0]
    win_2 = game[1]
    win_3 = game[2]
      if board.cells[win_1] == "X" && board.cells[win_2] == "X" && board.cells[win_3] == "X" || board.cells[win_1] == "O" && board.cells[win_2] == "O" && board.cells[win_3] == "O"
        @winner = board.cells[win_1]
        return true
     end
    end
    return false
  end 

  def draw?
    @board.full? && !won?
    end

  def winner
    if won? == true
      @winner
      end
    end

  def turn
    puts "player #{current_player.token}'s turn" 
    input = current_player.move(@board)
      if @board.valid_move?(input) == false
        puts "That is not a valid move please try again"
        turn
      else
        @board.update(input, current_player)
      end
    end

  def play
    board.display
    until over? == true || self.won? == true || self.draw? == true
      turn
      puts " "
      puts " "
      board.display
    end
    
    if won? == true
      puts "Congratulations #{@winner}!"
    elsif 
      draw? == true
      puts "Cats Game!"
    end
  end

end