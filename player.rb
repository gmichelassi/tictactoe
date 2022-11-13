class Player
  def initialize(mark:, name:)
    @mark = mark
    @name = name
  end

  def move(board)
    raise NotImplementedError
  end

  private
  
  attr_reader :mark, :name

  def mark_board(board)
    raise NotImplementedError
  end
end