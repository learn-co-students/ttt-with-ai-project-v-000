require 'pry'
class Game

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],[6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8]
  ]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1
  end

  # if turn count = odd
  #   current player = O

  def last_player
    @board.turn_count.odd? ? @player_1 : @player_2
    #turn count = 2 =>
  end

  def over?
    draw? || won?
  end

  def won?
    potential_winner_token = last_player.token
    position_taken = []
    @board.cells.each_with_index do |cell, i|
       position_taken << i if cell == potential_winner_token
     end
     winning_combo = []
     WIN_COMBINATIONS.each do |combo|
       winning_combo = combo if (combo - position_taken).empty? # if combo is included in position_taken
     end
    
     if winning_combo == []
       return false
     else
       return winning_combo
     end
     #winning_combo != [] ? winning_combo : false
  end

  def draw?
    @board.full? && !won?
  end

    def winner
      #binding.pry
      if won? == false
        #binding.pry
        nil
      else
        #binding.pry
        last_player.token
      end

      #won? ? last_player.token : nil
    end



end
