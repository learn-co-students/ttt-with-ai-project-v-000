require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
 
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count == 2
      player_1
    end
  end
           
  def over?
    if board.full? == true; true
      elsif board.full? == false; false
      else
    end
  end
 ################################################
 ################################################ 
  def won?
    if board.full? == true && winner = nil; false
  #   elsif board.each_with_index do |group, index| 
  #     if group[index] == WIN_COMBINATIONS[index];true
  #       end
      
    end
  end
            # returns false for a draw (FAILED - 6)
            # returns true for a win (FAILED - 7)
  ################################################
  ################################################

  def draw?(board)
    if full?(board) && won?(board)
        return false 
    elsif full?(board) && won?(board) != true
      return true    
    else won?(board) || full?(board) == false
      return false  
    end
  end
            # returns true for a draw (FAILED - 8)
            # returns false for a won game (FAILED - 9)
            # returns false for an in-progress game (FAILED - 10)
  
  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    else
   end
  end
            # returns X when X won (FAILED - 11)
            # returns O when O won (FAILED - 12)
            # returns nil when no winner (FAILED - 13)
  
  def turn(board)
      puts "Please enter 1-9:"
      position = gets.strip
        if valid_move?(board,position)
          then move(board,position,current_player(board))
            display_board(board)
        elsif  valid_move?(board,position) == false
          loop do
            puts "Sorry, please try a valid entry from 1-9:"
              position = gets.strip
        if valid_move?(board,position)
          then move(board,position,current_player(board))
            display_board(board)
          break
        end
      end
    end
  end 
            # makes valid moves (FAILED - 14)
            # asks for input again after a failed validation (FAILED - 15)
            # changes to player 2 after the first turn (FAILED - 16)
  
  def play(board)
    until over?(board) || won?(board) 
        turn(board) 
    end 
      if won?(board)
          puts "Congratulations #{winner(board)}!"
      else draw?(board)
          puts "Cats Game!"
    end
  end
            # asks for players input on a turn of the game (FAILED - 17)
            # checks if the game is over after every turn (FAILED - 18)
            # plays the first turn of the game (FAILED - 19)
            # plays the first few turns of the game (FAILED - 20)
            # checks if the game is won after every turn (FAILED - 21)
            # checks if the game is draw after every turn (FAILED - 22)
            # stops playing if someone has won (FAILED - 23)
            # congratulates the winner X (FAILED - 24)
            # congratulates the winner O (FAILED - 25)
            # stops playing in a draw (FAILED - 26)
            # prints "Cats Game!" on a draw (FAILED - 27)
            # plays through an entire game (FAILED - 28)


end