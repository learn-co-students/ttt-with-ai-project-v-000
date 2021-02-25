module Players #overwriting module that wraps the Human class
  class Human < Player # Human class inherits all functionality from Player class

    def move(board)
      board.display
      puts "Please enter your selection(1-9): "
      gets.strip # gets is requesting from stdin, in the test it's faking a string
    end
  end
end
