module Players
  class Human < Player

  def move(board)
    puts "Please input your move"
    gets.strip
  end

  end
end
