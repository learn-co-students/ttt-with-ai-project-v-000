require 'pry'
class Cli

  def start
    puts "Who will go first?"
    puts "Type 1 for computer"
    puts "Type 2 for human"
    input = gets.strip
    if input == 1
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    elsif input == 2
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    else
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    end
  end

end
