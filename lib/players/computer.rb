module Players
  class Computer < Player
    # attr_reader :board

    def move(useless_argument=nil)
      (1..9).to_a.sample.to_s
    end
  end
end
