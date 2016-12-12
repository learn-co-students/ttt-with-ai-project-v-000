
class GameRunner
  attr_accessor :playing

  def play_choice(a, b)
    g = Game.new(a, b)
    g.play
    self.play_again?
  end

  def play_again?
    puts "Wana play again? Type : y"
    play_again = gets.strip
    self.playing = false unless play_again.downcase == "y"
  end

  def initialize
    self.playing = true
  end

  def interface
    while self.playing
      pid = fork{ exec 'afplay', "./fixtures/POL-sunset-route-short.wav"}
      puts "Welcome to the battle of a lifetime."
      puts "Tic Tac Toe  MASTER!!!"
      puts "Pick your game. 1 - 4 or quit"
      puts "1)   COMP VS COMP"
      puts "2) PLAYER VS COMP"
      puts "3)   COMP VS PLAYER"
      puts "4) PLAYER VS PLAYER"
      puts "Type: 'quit' any time to quit."
      puts "______________________________"
      puts "-----> X GOES FIRST <--------!"
      puts "=============================="
      input = gets.strip
      case input
      when "quit"
        puts "Thanks for playing."
        self.playing = false
      when "1"
        play_choice(Player::Compurter.new("X"), Player::Computer.new("O"))
      when "2"
        play_choice(Player::Human.new("X"), Player::Computer.new("O"))
      when "3"
        play_choice(Player::Compurter.new("X"), Player::Human.new("O"))
      when "4"
        play_choice(Player::Human.new("X"), Player::Human.new("O"))
      end
    end
  end
end
