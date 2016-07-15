require_relative './players/human.rb'
require_relative './player.rb'

class Game
  include Players
  # include Player
  attr_accessor :board, :player_1, :player_2, :winner, :token

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.cells == player_1 ? player_2 : player_1
  end

  def player_1
    @player_1
    # turn
    # gets.chomp
  end

  def player_2
    @player_2
    # turn
    # gets.chomp
  end

  def over?
    if self.board.full? == true
      return true
    elsif won?.class == NilClass || Array
      return false
    else
      return false
    end

    # if !self.board.full?
    #   return false
    # elsif won?
    #   return true
    # elsif draw?
    #   return true
    # elsif self.board.full?
    #   return true
    # end
  end

  def won?
    @winner = WIN_COMBINATIONS.find do |combo|
      # puts position_taken?(combo[0])
      # puts position(combo[1])
      # puts position(combo[2])

      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
    end
    # WIN_COMBINATIONS.detect do |combo|
    #   @winning_token = position(combo[0][0])
    # end
    # puts @winning_token
    # puts @winner.value
    # puts WIN_COMBINATIONS[@winner][0]
    # if @winner.class == Array
    #   puts position(@winner[0])
    # end
    @winner
    # if @winnner.is_a?(Integer) == true
    #   return true
    # # elsif draw?
    # #   return false
    # else
    #   return false
    # end
  end

  def draw?
    if won?
      return false
    elsif self.board.full? && over?
      return true
    # elsif over?
    #   return true
    else
      return false
    end
  end

  def position(location)
    self.board.position(location+1)
  end

  def position_taken?(location)
    self.board.taken?(location+1)
  end

  def winner
    if won?.class == Array
      return position(@winner[0])
    elsif won?.class == NilClass
      return nil
    end
  end

  def turn
    self.board.display
    puts "Please enter 1-9"
    input = gets
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
      self.board.display
    else
      # turn
    end

  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
