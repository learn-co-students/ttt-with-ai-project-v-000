class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =   [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "Welcome to Tic-tac-toe!"
    puts "How many players?"
    puts "Enter 0 to simulate a game between two computer players."
    puts "Enter 1 for a game between a human player and computer player."
    puts "Enter 2 for a 2 game between two human players."
    puts "Enter WAR to simulate 100 computer vs. computer games."

    input = gets.strip

    game=Game.new

    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      game.play
    elsif input == "1"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      game.play
    elsif input == "2"
      game.play  # two human players is the default
    elsif input.upcase == "WAR"
      draws = 0
      100.times do
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
        draws +=1 if game.draw?
          end
      puts "Out of 100 simulated games, there were #{draws} draws!"
    else
      puts "Invalid Input.  Please try again."
      game.start
    end

    puts "Would you like to play again? y/n?"
          input = gets.strip.downcase
          if input == "y"
            game.start
          else
            puts "Goodbye!"
            exit
          end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def opponent
    @board.turn_count.odd? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      if @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        combo
      else
        false
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
     won? || draw?
   end

   def winner
     if !won? || draw?
       nil
     else
       @board.cells[won?[0]]
     end
   end

   def turn
     puts "What is your move #{current_player.token}?"
     target_position = current_player.move(@board)
     if !@board.valid_move?(target_position)
       puts "That is not a valid move!"
       turn
     else
       @board.update(target_position, current_player)
       @board.display
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

end
