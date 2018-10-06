module Players
  class Computer < Player

  def move(board)
    puts "Computer:"
    (1+rand(9)).to_s
  end
  
  end
end