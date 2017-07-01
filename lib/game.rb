require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def token
    @player_1.token = "X"
    @player_2.token = "O"
  end

  def full?
    self.board.cells.all? do |square|
      if square == "X" || square == "O"
        true
      else
        false
      end
    end
  end

  def over?
    won? != nil || draw?
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combination_array|
      win_index_1 = win_combination_array[0]
      win_index_2 = win_combination_array[1]
      win_index_3 = win_combination_array[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        win_combination_array
      end
    end
  end

  def draw?
    if won? == nil && full? == true
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combination_array|

      win_index_1 = win_combination_array[0]
      win_index_2 = win_combination_array[1]
      win_index_3 = win_combination_array[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_1 == "X"
        return "X"
      elsif position_1 == position_2 && position_2 == position_3 && position_1 == "O"
        return "O"
      end
    end
  end

  def self.start
    puts "How many players? (type 0, 1, or 2)"
      player_count = gets.strip.to_i
        if player_count == 0
          self.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
        elsif player_count == 2
          self.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        elsif player_count == 1
          puts "Who shall go first and be X? (type human or computer)"
            first_player = gets.strip.downcase
            if first_player == "human"
              return self.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
              return self.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
            else
              puts "wrong!"
            end
``      end
  end

  def play
    while !over?
      turn
    end
    if over? == true && won? != nil && winner == "X"
      puts "Congratulations X!"
    elsif over? == true && won? != nil && winner == "O"
      puts "Congratulations O!"
    elsif over? == true && draw? == true
      puts "Cat's Game!"
    elsif over? == true
      puts "Cat's Game!"
    end
  end

  def turn
    player = self.current_player
    index = player.move(board)
    if self.board.valid_move?(index) == true
       self.board.update(index, current_player)
       self.board.display
    else
      self.turn
    end
  end

  def self.play_again
    puts "Would you like to play again?"
      answer = gets.strip.downcase
      if answer == "yes" || answer == "y" || answer == "ok" || answer == "okay" || answer == "sure"
        game = self.start
        game.board.display
        game.play
        self.play_again
      else
        abort("Goodbye")
      end
  end
end
