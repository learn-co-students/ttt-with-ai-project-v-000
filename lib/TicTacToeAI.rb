class TicTacToeAI
  def initialize 
  end
  
  def start
    @computer_one = Players::Computer.new("X")
    @computer_two = Players::Computer.new("O")
    @human_one = Players::Human.new("X")
    puts "How many players? (0, 1 or 2)"
    input = gets.chomp
    case input
      when "0"
        Game.new(@computer_one, @computer_two).play
      when "1"
        go_first
      when "2"
        Game.new.play
      when "wargames"
        x = 0
        o = 0
        draw = 0
  
        100.times do
          wargame = Game.new(@computer_one, @computer_two)
          wargame.play
  
          if wargame.winner == "X"
            x = 1
          elsif wargame.winner == "0"
            o = 1
          elsif wargame.draw?
            draw +=1
          end
        end
        puts "This round had #{x} wins for X, #{o} wins for O, and #{draw} draws."
        puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
        puts "HOW ABOUT A NICE GAME OF CHESS?"
      else
        puts "Invalid entry, please try again."
        start
    end
    replay?
  end
  
  def go_first
    puts "Would you like to take the first turn? Please input Y or N."
    answer = gets.chomp
    case answer
      when "Y"
        Game.new(@human_one, @computer_two).play
      when "N"
        Game.new(@computer_one).play
      else
        puts "Invalid entry, please try again."
        start
    end
  end
  
  def replay?
    puts "Would you like to play again? Please input Y or N."
    answer = gets.chomp
    case answer
      when "Y"
        start
      when "N"
        puts "Goodbye!"
        return false
      else
        replay?
    end
  end
  
end