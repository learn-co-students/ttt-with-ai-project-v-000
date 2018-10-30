

module Players 

class Human < Player
  
  def move(input)
    puts "Please enter 1-9:"
    gets.chomp
  end
end

end 


