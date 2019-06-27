module Players
  class Human < Player
  
  def move(input)
    puts "please enter your selection"
    gets.strip
  end
end
end