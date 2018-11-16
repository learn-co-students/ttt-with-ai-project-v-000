#require_relative "../player.rb"

module Players
class Human < Player

  def move(user_input)
    gets.chomp 
  end

end #ends class
end #ends module
