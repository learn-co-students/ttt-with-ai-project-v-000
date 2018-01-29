class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end
end


class Players
  class Human < Player

    def move(board)
      input = gets.strip
      return "#{input}"
    end

  end

end
