require 'pry'

class Game 

  attr_accessor :board, :player_1, :player_2

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

   def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end 

  def over?
    board.full?
   
  end 

  def won?
    WIN_COMBINATIONS.each do |index|
      return index if index.all? {|position| board.cells[position] == "X" }
      return index if index.all? {|position| board.cells[position] == "O" }
    end
    false
    end

  def draw?
    over? && !won?
  end 


  def winner
      WIN_COMBINATIONS.each do |index|
      return "X" if index.all? {|position| board.cells[position] == "X" }
      return "O" if index.all? {|position| board.cells[position] == "O" }
    end
    nil
  end 

  
    def turn
      board.display
      spot = current_player.move(board)
      if board.valid_move?(spot)
        board.update(spot, self.current_player)
      else
        puts "invalid entry"
        turn
      end

    end

  # def turn 
  #     player_input = current_player.move(board)
  #     if board.valid_move?(player_input)
  #       board.update(player_input, current_player)
  #     else
  #       turn
  #   end 
  # end

  # def play

  #   while !over?
  #     turn
  #   end
  #   board.display

  #   if won?
  #     puts "Congratulations #{winner}!"
  #   elsif draw?
  #     puts "Cats Game!"
  #   end   
  #   board.display
  # end
    def play
      while over? != true
        turn
      end
      if won?
        board.display
        puts "Congratulations #{@winner}!"
      elsif draw?
        board.display
       puts "Cats Game!"
      end
    end





end 