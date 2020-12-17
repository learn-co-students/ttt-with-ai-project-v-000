module Players #overwriting module that wraps the Computer class
  class Human < Player # Human class inherits all functionality form Player module

    def move(input)
      puts "Please enter your selection: [X or O]"
      gets.strip
    end

  end
end
