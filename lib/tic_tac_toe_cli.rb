class TicTacToeCLI
  def initialize
  end

  def top
    puts "Welcome to Tic-Tac-Toe (Object-Oriented Version)"
    puts "======================"
  end

  def pick_setup
    input = nil
    until ["0","1","2"].include?(input)
      puts "How many human players? (0, 1, 2)"
      input = gets.strip
    end

    if input=='0'
      p1=Players::Computer.new("X")
      p2=Players::Computer.new("O")
    elsif input=="1"
      y=nil
      until y=="computer"|| y=="c" || y =="h" ||y=="human"
        system "clear"
        puts "Who should go first, the computer player or the human player? (h)uman or (c)omputer"
        y= gets.downcase.strip
      end
      if y=="human" || y =="h"
        p1=Players::Human.new("X")
        p2=Players::Computer.new("O")
      else
        p1=Players::Computer.new("X")
        p2=Players::Human.new("O")
      end
    else
      p1=Players::Human.new("X")
      p2=Players::Human.new("O")
    end
    Game.new(p1,p2)
  end

  def call
    top
    x=nil
    until x == "exit" || x == "e"
      system "clear"
      game=pick_setup
      game.play
      puts "Input (e)xit to end the game or anything else to play again."
      x=gets.strip.downcase
    end
  end
end
