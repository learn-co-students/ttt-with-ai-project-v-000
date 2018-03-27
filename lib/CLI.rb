class CLI
  def initialize
    puts "welcome, who is playing"
    puts '1. player vs player'
    puts '2. player vs computer'
    puts '3. computer vs computer'
    puts '4. war games'
    user_input = gets.strip.to_i
    case user_input
    when 1
      Game.new().play
    when 2
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    when 3
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    when 4
      winners = []
      100.times do
        current_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        current_game.play
        winners << current_game.winner
      end
      puts ''
      puts 'War_is over!'
      3.times{puts''}
      x_wins = winners.find_all{ |winner| winner == 'X'}
      o_wins = winners.find_all{ |winner| winner == 'O'}
      puts "X won #{x_wins.length} times and O won #{o_wins.length} times and there were #{100 - o_wins.length - x_wins.length} draws."
    else
      puts 'sorry, what was that?'
    end
  end

end
