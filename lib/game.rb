require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1 = "", player_2 = "", board =[])
    winner = ""
    board == [] ? @board = Board.new : @board = board
    if player_1 != ""
      @player_1 = player_1
    else
      @player_1 = Human.new("X")
    end
    if player_2 != ""
      @player_2 = player_2
    else
      @player_2 = Human.new("O")
    end
  end

  def current_player
    if @board.cells.select{|space| space == " "}.count % 2 == 0
      player_2
    else
      player_1
    end
  end

  def over?
    (@board.full? == true || self.won? == true) ? true : false
  end

  def won?
    Game::WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end

  end

  def winner
    if combo = won?
      @board.cells[combo.first]
    end
  end

  def draw?
    (self.over? && !self.won?) ? true : false
  end


  def play
    @board.reset!
    while !self.over?
      @board.display
      self.turn
      if self.won?
        @board.display
        puts "Congratulations #{self.winner}!"
        break
      elsif self.draw?
        @board.display
        puts "Cats Game!"
        break
      end
    end
  end


  def turn
    puts "Pick a spot."
    spot = ""
    spot = gets.strip
    while !board.valid_move?(spot)
      puts "Pick a spot."
      spot = gets.strip
    end
     board.update(spot, self.current_player)
  end
end
