module Players      #over writing module
  class Human < Player    #inherits all functionality from Player
  
  
  def move(board)
    puts "Please enter your selection"
    gets.strip                               #gets recieves user input always add strip
  end 
  
  
 end 
end 