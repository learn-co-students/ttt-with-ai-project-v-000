require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,4,8], # Diagonal Row # 1
    [6,4,2], # Diagonal Row # 2
    [0,3,6], # Vertical Column 1
    [1,4,7], # Vertical Column 2
    [2,5,8]  # Vertical Column 3
]

  def initialize(player1 = Human.new("X"), player2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  #draw? method below
  def draw?
    @board.full? && !won?
  end

  def over?
    #specify what a won game is
    won? || draw?
  end

  def winner    
     won? != nil ? @board.cells[won?.first] : nil
  end
       
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def turn
    puts "#{current_player.token} your move."
    pos = current_player.move(@board)
      if @board.update(pos, current_player) == nil
        turn
      else
        @board.update(pos, current_player)
      end
  end

  def play
    while !over? && !@board.full?
      turn
    end

    if won?
      puts "Congratulations #{winner}!" 
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players?"
    players = gets

    puts "Who is X, player 1 or player 2?"
    token = gets

    if players.to_i == 0
      token == "1" ? player_1 = Computer.new("X") && player_2 = Computer.new("O") : player_1 = Computer.new("O") && player_2 = Computer.new("X")
    elsif players.to_i == 1
      token == "1" ? player_1 = Human.new("X") && player_2 = Computer.new("O") : player_1 = Human.new("O") && player_2 = Computer.new("X")
    elsif players.to_i == 2
      token == "1" ? player_1 = Human.new("X") && player_2 = Human.new("O") : player_1 = Human.new("O") && player_2 = Human.new("X")
    end

    @player_1 = player_1 
    @player_2 = player_2

    self.play until self.over?
  end

end