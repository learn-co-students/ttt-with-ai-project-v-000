class CLI
  def start
    puts "Welsome to Tic-tac-toe!"
    puts " "
    puts "Please select a play style from the Menu"
    menu
  end

  def menu
    puts "0 - Computer Vs Computer"
    puts "1 - You Vs Computer"
    puts "2 - You Vs A Friend (or Yourself!)"
    puts "exit - leave the Tic-tac-toe game"
    puts " "
    puts "Enter Your Selection Below"
    selection = gets.strip

    case(selection)
    when "0"
      computer_vs_computer_game
    when "1"
      human_vs_computer_game
    when "2"
      human_vs_human_game
    when "exit"
      exit
    else
      puts" Please enter a correct option"
      menu
    end
  end

  #creates a new game with two computer players
  #play_again method restarts CLI
  def computer_vs_computer_game
    game = Game.new
    puts "This game determines which of our AI Overlords wins Earth "
    Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
    play_again?
  end
  #creates a game with one human and one computer
  #human should pick token
  def human_vs_computer_game
    game = nil
    puts "Get three in a row to win!"
    puts " "
    puts "Do you want to be X? Enter y/n"
    selection = gets.strip
    if selection == "y"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    elsif selection == "n"
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
    else
      puts "Please enter a valid response"
      selection = gets.strip
    end
    game.play
    play_again?
  end

  def human_vs_human_game
    game = nil
    puts "Get three in a row to win!"
    game = Game.new
    game.board.display
    game.play
    play_again?
  end

  def play_again?
    puts "Do you want to play again? Enter y/n"
     input = gets.strip
     if input == "y"
       menu
     else
       puts "Thanks, see you next time!"
       exit
     end
   end


end
