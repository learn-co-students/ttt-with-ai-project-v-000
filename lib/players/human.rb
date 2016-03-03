class Human < Player

  def move(input)
    input = ""
    puts "Please input your choice of move:"
    input = gets.to_s.strip
  end


end
