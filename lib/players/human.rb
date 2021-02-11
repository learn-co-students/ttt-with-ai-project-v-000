module Players #overwriting module that wraps the Human class
  class Human < Player # Human class inherits all functionality from Player class

    def move(board)
      puts "Please enter your selection: "
      gets.strip
    end
  end
end
