class Game

WIN_COMBINATIONS = [[0,1,2],
  [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.odd?
      @player_2
    elsif board.turn_count.even?
      @player_1
    else

    end
  end

  def won?
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board.cells[win_index_1]
    position_2 = @board.cells[win_index_2]
    position_3 = @board.cells[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
  end

  def draw?
    if won? == false && board.full?
      true
    else
      false
    end
  end

    def over?
      draw? || won?
    end

  def winner
    if index = won?
    board.cells[index[0]]
  end
  end

  def turn
    num = current_player.move(board)
    if board.valid_move?(num)
    board.update(num, current_player.token)
    board.display
  else
    turn
  end
  end

  def play
    while !over?
      turn
    end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  end

  def self.start_game
    puts "Hello, let's play Tic-Tac-Toe!"
    puts "Would you like to play a 'simulation', 'single player', or 'two player'?"
    a = gets.strip
    if a == "simulation"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      new_game.play

    elsif a == "single player"
      puts "Who would like to go first and be 'X'?"
      puts "Enter 'me' or 'computer'"
    b = gets.strip
    if b == "me"
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      new_game.play
    elsif b == "computer"
      new_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      new_game.play
    end

    elsif a == "two player"
      new_game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      new_game.play
    else
      Game.start_game
    end
  end


end
