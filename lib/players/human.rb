module Players #this is a module
  class Human < Player #player can take this information and use it as well

    def move(board)
      puts "Please enter 1-9:" #ask user for info
      gets.strip #and return it 
    end
  end
end
