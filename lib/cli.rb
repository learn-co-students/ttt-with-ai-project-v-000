class CLI

  def start
    puts "Hello, welcome to this tic-tac-toe game."
    puts "Please press '1' for single-player mode, '2' for dual-player mode, or '3' for computer mode?"

    response = gets.strip.to_i

    if !(response.between?(1,3))
      puts "Your input is incorrect. Please start over."
      start
    elsif response == 1
      puts "Hello, please enter your name:"
      p_1 = gets.strip
      puts "Hello #{p_1}! You are player 'X' and the computer is player 'O'."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      puts "Here is a hard copy of the board to help you strategize:"
      new_game.board.first_display
      new_game.play
    elsif response == 2
      puts "Who would like to be player 1?"
      puts "Please enter your name:"
      p_1 = gets.strip
      puts "Hello #{p_1}! You are player 'X'."
      puts "Who would like to be player 2?"
      puts "Please enter your name:"
      p_2 = gets.strip
      puts "Hello #{p_2}! you are player 'O'."
      new_game = Game.new
      puts "Here is a hard copy of the board to help you strategize:"
      new_game.board.first_display
      new_game.play
    else response == 3
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      new_game.play
    end
  end

end
