require 'pry'

class Game
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

  attr_accessor :board, :player_1, :player_2, :current_player

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1.nil?
      @player_1 = Human.new("X")
    else
      @player_1 = player_1
    end
    if player_2.nil?
      @player_2 = Human.new("O")
    else
      @player_2 = player_2
    end
    if board.nil?
      @board = Board.new
    else
      @board = board
    end
  end

  def current_player
    self.board.turn_count%2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.find {|c| @board.taken?(c[0]+1) && @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]]}
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    winner = nil
    if self.won?
      WIN_COMBINATIONS.each do |c|
        if @board.taken?(c[0]+1)&& @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]]
          winner = @board.cells[c[0]]
        end
      end
      return winner
    else
      return winner
    end
  end

  def turn
    puts "Turn: #{@board.turn_count + 1}"
    player = self.current_player
    m = player.move(@board)
    if !@board.valid_move?(m)
      turn
    else
      @board.update(m, player)
      @board.display
    end
  end

  def play
    while !over?
      puts "Please enter position 1-9"
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cats Game!"
    end
  end


end
