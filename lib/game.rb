require_relative 'board.rb'
require_relative 'player.rb'

class Game

  WIN_COMBINATIONS = [[0, 1, 2], 
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2, :name

  @@wins = []

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

      if player_1.class == Human
        player_1.name = "Player 1"
      else
        player_1.name = "Joshua_1"
      end

      if player_2.class == Human
        player_2.name = "Player 2"
      else
        player_2.name = "Joshua_2"
      end

  end

  def self.all
    @@wins
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?

    WIN_COMBINATIONS.each do |win|

      if board.cells[win[0]] == "X" && board.cells[win[1]] == "X" && board.cells[win[2]] == "X"
        return win
      elsif board.cells[win[0]] == "O" && board.cells[win[1]] == "O" && board.cells[win[2]] == "O"
        return win
      end
    end

    false
  end

  def draw?
    over? && !won? ? true : false
  end

  def over?

    if board.turn_count == 9
      return true
    else
      return false
    end

  end

  def winner
    if won? 
      winning_line = won?
      return board.cells[winning_line[0]]
    end

    nil
  end

  def turn
    board.display
    move = current_player.move(current_player.token, board)
    
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      puts "That is not a valid move"
      turn
    end

  end

  def play

    while !won? && !draw? 
      puts "It's #{current_player.name}'s turn"
      turn
    end

    if won?
      puts " "
      board.display
      @@wins << winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts " "
      board.display
      puts "Cats Game!"
    end

  end







end