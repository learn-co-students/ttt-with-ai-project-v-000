module Players
  class Human < Player

  def move(board)
    puts "Please input your move"
    move = gets.chomp
  end

  end
end
