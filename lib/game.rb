class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], #first diagonal
    [2,4,6]  #second diagnonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸"
    puts "Welcome to Tic Tac Toe!"
    puts " "
    puts "Select Game Type:"
    puts "1) 2 Player Game"
    puts "2) Beat the Computer!"
    puts "3) Simulate Game"
    puts "°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸"
    game_type = gets.strip.to_s

    if game_type == "1"
      puts "X goes first!"
      game = Game.new
      until game.over?
        game.play
      end
    elsif game_type == "2"
      puts "Would you like to go first? (y/n)"
      first = gets.strip.to_s
      if first.downcase == "y" || first.downcase == "yes"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new)
        until game.over?
          game.play
        end
      elsif first.downcase == "n" || first.downcase == "no"
        puts "Computer goes first!"
        game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), board = Board.new)
        until game.over?
          game.play
        end
      end
    elsif game_type == "3"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new)
      until game.over?
        game.play
      end
    elsif game_type == "exit"
      puts "Thanks for playing!"
      exit
    end
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        win_combination
      end
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    while winning_indexes = won?
      return @board.cells[winning_indexes[0]]
      break
    end
  end

  def turn
    new_move = current_player.move(@board)
    if !@board.valid_move?(new_move)
      puts "Invalid move."
      turn
    else
      @board.update(new_move, current_player)
      @board.display
    end
  end

  def play
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    until over?
      turn
    end
    if won?
      if player_1.instance_of?(Players::Computer) && winner == "X"
        puts "YOU LOSE! (╥﹏╥)"
        self.again
      elsif player_2.instance_of?(Players::Computer) && winner == "O"
        puts "YOU LOSE! (╥﹏╥)"
        self.again
      else
        puts "<:::::::::::::::||===)"
        puts "Congratulations #{winner}!"
        puts "(===||:::::::::::::::>"
        self.again
      end
    elsif draw?
      puts "Cat's Game!"
      puts "(,,,)=(^.^)=(,,,)"
      self.again
    end
  end

  def again
    again = ""
    until again.downcase == "n" || again.downcase == "no"
      puts "Play again? (y/n)"
      again = gets.strip
      if again.downcase == "y" || again.downcase == "yes"
        game = Game.new
        until game.over?
          game.start
        end
      end
    end
    puts "Thanks for playing!"
    exit
  end

end
