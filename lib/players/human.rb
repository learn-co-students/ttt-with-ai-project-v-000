module Players
  class Human < Player
  
   def move(board)
      "#{gets.strip.to_i}"
    end
  
  end
end