module Players
  class Human < Player
    def move(input)
      input = self.gets
    end

    def gets
      gets.chomp
    end
  end
end