module Players
class Human < Player


  def move(board) #receives a string 1-9 from user
    puts "Please #{token}, enter a number from 1-9"
    return gets.chomp
  end











end
end
