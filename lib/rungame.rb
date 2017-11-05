class RunGame

  def initialize
    puts "Welcome to Tic Tac Toe!"
  end

  def run
    input = nil
    if input != "exit"
      puts "What kind of game would you like to play? Please enter '1' for Computer vs. Computer, '2' for Computer vs. Human, '3' for Human vs. Human, or 'exit' to leave. Or, try 'wargames' for.....well, you'll see."
      input = gets.chomp

      case input
      when "1"
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        run
      when  "2"
        puts "Who should go first and be 'X'? Enter 'computer' or 'human': "
        input = gets.chomp
        if input == "human"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        elsif input == "computer"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        end
        run
      when "3"
        puts "Who should go first - X or O?"
        input = gets.chomp
        if input == "X"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        elsif input == "O"
          Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"), board = Board.new).play
        end
        run

      when "wargames"
        x_counter = 0
        o_counter = 0
        draw_counter = 0
        100.times do
          Game.new.wargames
        end
        run
      end

    elsif input == "exit"
        puts "Good bye."
      end
    end

end
