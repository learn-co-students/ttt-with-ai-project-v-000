require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  # Defining WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # diagonal 1
    [2,4,6] # diagonal 2
  ]

  #Initialized a new game with two players and a new board
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #Determines the current character by judging the number of plays made
  def current_player
    if self.board.turn_count.even?
      current_player = @player_1
    else
      current_player = @player_2
    end
  end

  #define a method to check for winning combinations
  def won?
    win_combo = nil
    Game::WIN_COMBINATIONS.each do |win_combination|
      position_1 = self.board.cells[win_combination[0]] # load the value of the board at win_index_1
      position_2 = self.board.cells[win_combination[1]] # load the value of the board at win_index_2
      position_3 = self.board.cells[win_combination[2]] # load the value of the board at win_index_3
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combo = win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combo = win_combination
      end
    end
    win_combo
  end

  #Checks if the board is draw
  def draw?
    (!won? && self.board.full?)
  end

  #Checks if the game is over
  def over?
    (won? || draw?)
  end

  #Determines the winner character
  def winner
    token = nil
    if won?
      token = self.board.cells[won?[0]]
    end
    token
  end

  #Fills in the move requested by the player on the board
  def turn
    puts "Player #{self.current_player.token}'s turn - "
    user_input = self.current_player.move(board)
    if self.board.valid_move?(user_input)
      self.board.update(user_input, current_player)
      self.board.display
    elsif user_input.to_i.between?(1,9) == false
      puts "That is not a valid move!"
      turn
    else
      puts "Sorry! That position is taken."
      turn
    end
  end

  #Defines the play method
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  #Defines the wargames method
  def wargames
    game_counter = 0
    win_counter = 0
    draw_counter = 0
    until game_counter == 100
      self.board.reset! #Necessary to reset the board to start new game, as the game is only looping thru this method
      system("clear")
      until over?
        turn
      end
      if won?
        win_counter+=1
      elsif draw?
        draw_counter+=1
      end
      game_counter+=1
    end
    puts "Total games played: #{game_counter}"
    puts "Total games won: #{win_counter}"
    puts "Total games draw: #{draw_counter}"
  end

end
