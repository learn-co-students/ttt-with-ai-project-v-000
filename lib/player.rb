class Player
  attr_reader :token
  
  def initialize(token)
    if token == "X" || token == "O"
      @token = token
    else
      begin
        raise ArgumentError.new("Token must be 'X' or 'O'.")
      rescue ArgumentError => error
        puts error.message
      end
    end
  end
end
