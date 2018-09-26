require 'pry'
class Cli

  def start
    puts "Please choose an opponent:"
    puts "Enter 1 for human"
    puts "Enter 2 for computer"
    input = gets.strip
    if input == "1"
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    elsif input == "2"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    else
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    end
  end

end
