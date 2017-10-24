class TicTacToeCLI

  def call
    puts "How many players would you like - 0, 1, 2?"
    input = gets.strip
    case input
    when "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    play_until_finished
  when "1"
    Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    puts "That was fun! Would you like to play again?"
    play_until_finished
  when "2"
    Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    puts "That was fun! Would you like to play again?"
    play_until_finished
  else "Please input 0,1, or 2."
  end
end

  def play_until_finished
    puts "Do you want to play again? y or n."
    input = gets.strip
    case input
    when "y"
    call
    when "n"
    puts "Goodbye"
  else call
  end
end

end
