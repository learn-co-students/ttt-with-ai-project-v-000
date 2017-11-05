class RunGame

  def initialize
    puts "Welcome to Tic Tac Toe!"
  end

  def run
    input = nil
    if input != "exit"
      puts "What kind of game would you like to play? Please enter '1' for Computer vs. Computer, '2' for Computer vs. Human, '3' for Human vs. Human, or 'exit' to leave."
      input = gets.chomp

      case input
      when "1"
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        run
      when  "2"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        run
      when "3"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        run
      end

    elsif input == "exit"
        puts "Good bye."
      end
    end

end
