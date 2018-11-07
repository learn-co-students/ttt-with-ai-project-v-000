require 'pry'
class Game
  attr_writer :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    if self.board.turn_count.odd? == false
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    win_combo_1 = WIN_COMBINATIONS[0]
    win_combo_2 = WIN_COMBINATIONS[1]
    win_combo_3 = WIN_COMBINATIONS[2]
    win_combo_4 = WIN_COMBINATIONS[3]
    win_combo_5 = WIN_COMBINATIONS[4]
    win_combo_6 = WIN_COMBINATIONS[5]
    win_combo_7 = WIN_COMBINATIONS[6]
    win_combo_8 = WIN_COMBINATIONS[7]


    if win_combo_1.all?{|index| board.cells[index] == "X"} || win_combo_1.all?{|index| board.cells[index] == "O"}
      return win_combo_1
    elsif win_combo_2.all?{|index| board.cells[index] == "X"} || win_combo_2.all?{|index| board.cells[index] == "O"}
      return win_combo_2
    elsif win_combo_3.all?{|index| board.cells[index] == "X"} || win_combo_3.all?{|index| board.cells[index] == "O"}
      return win_combo_3
    elsif win_combo_4.all?{|index| board.cells[index] == "X"} || win_combo_4.all?{|index| board.cells[index] == "O"}
      return win_combo_4
    elsif win_combo_5.all?{|index| board.cells[index] == "X"} || win_combo_5.all?{|index| board.cells[index] == "O"}
      return win_combo_5
    elsif win_combo_6.all?{|index| board.cells[index] == "X"} || win_combo_6.all?{|index| board.cells[index] == "O"}
      return win_combo_6
    elsif win_combo_7.all?{|index| board.cells[index] == "X"} || win_combo_7.all?{|index| board.cells[index] == "O"}
      return win_combo_7
    elsif win_combo_8.all?{|index| board.cells[index] == "X"} || win_combo_8.all?{|index| board.cells[index] == "O"}
      return win_combo_8
    else
      false
    end
  end

  def draw?
    if board.full? == true && self.won? == false
      true
    elsif board.full? == false
      false
    elsif self.won? == true
      false
    else
    end
  end

  def over?
    if won? != false
      true
    elsif draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? != false
      win_array = won?
      index = win_array[0]
      return board.cells[index]
    else
      nil
    end
  end

  def turn
    input = current_player.move(board)
    if self.board.valid_move?(input) == false
      turn
    else
      self.board.update(input, current_player)
    end
  end

  def play
    turn until over? == true
    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic-Tac-Toe!"
    puts "Would you like to play a 0, 1, or 2 player game?"
    game_type = gets.strip

    if game_type == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    elsif game_type == "1"
      puts "Who should go first? You or Al?"
      first_player = gets.strip
        if first_player == "Al"
          Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
        else
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        end
    elsif game_type == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    else
    end

    puts "Would you like to play again?"
    user_input = gets.strip
    if user_input == "yes"
      start
    else
    end
  end
end
