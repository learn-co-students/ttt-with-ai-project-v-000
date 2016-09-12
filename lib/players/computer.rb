module Players
  class Computer < Player
    attr_accessor :token

    def move(board)
      num = rand(9) + 1
      num.to_s
    end

end
end
