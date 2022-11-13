class Player
  def initialize(mark:, name:)
    @mark = mark
    @name = name
  end

  attr_reader :mark, :name

  def move(board)
    raise NotImplementedError
  end

  private

  def mark_board(board)
    raise NotImplementedError
  end
end