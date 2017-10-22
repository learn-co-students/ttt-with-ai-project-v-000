module Players
  class Human < Player
    def move(board)
      @input_output.display "Please enter your move:"
      self.gets
    end

    # Needed for tests
    def gets
      @input_output.read
    end
  end
end
