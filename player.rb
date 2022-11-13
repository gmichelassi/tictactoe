class Player
  def initialize(mark:, identifier:)
    @mark = mark
    @identifier = identifier
  end

  def move(board)
    raise NotImplementedError
  end

  private
  
  attr_reader :mark, :identifier

  def mark_board(board)
    raise NotImplementedError
  end
end