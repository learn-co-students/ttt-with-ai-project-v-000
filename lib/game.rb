require 'pry'
require_relative './players/human.rb'

class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def initialize(player_1=Players::Human.new("X"), player_2 =Players::Human.new("O"), board = Board.new)
    @player_1= player_1
    @player_2= player_2
    @board= board
  end
  
  def current_player
    counter = 0
    @board.cells.each do |count|
      if count == "O" || count == "X"
      counter += 1
      end
    end
    if counter.even?
      @player_1
   elsif !counter.even?
      @player_2
    end
  end
  
  def won?
   WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      w = won?.first
      @board.cells[w]
    end
  end
  
  def turn
    current_move = current_player.move(board)
      if !board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{board.turn_count+1}"
          board.display
         board.update(current_move, current_player)
        puts "#{current_player.token} moved #{current_move}"
         board.display
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
    
    
    
  
end