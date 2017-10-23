module Players
  class Human  < Player

  def move(board)
    puts "Please make a valid move:"
    gets.chomp
  end


  def are_we_human?
   "or are we dancers?"
  end
end

end #class Human
