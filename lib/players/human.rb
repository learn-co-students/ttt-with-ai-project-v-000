module Players #overwriting module that wraps the Human class
  class Human < Player # Human class inherits all functionality from Player class

    def move(input)
      puts "Please enter your selection: [X or O]"
      gets.strip
    end
  end
end
