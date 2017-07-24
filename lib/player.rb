class Player
  attr_reader :token

  def initialize(token, input_output = InputOutput::CLI.new)
    @input_output = input_output
    @token = token
  end
end
