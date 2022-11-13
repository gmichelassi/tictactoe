require './player'

class Computer < Player
  def initialize(mark:, identifier: :computer, difficulty: :hard)
    super(mark: mark, identifier: identifier)

    @difficulty = difficulty
  end

  def move(board, available_spaces)
    spot = get_spot(board)

    board.board[spot] = mark
  end

  private

  attr_reader :difficulty

  def get_spot(board)
    return board.get_random_move if easy?

    board.get_best_move(mark, other_player_mark)
  end

  def easy?
    difficulty == :easy
  end

  def other_player_mark
    "X" if mark == "O" 

    "O"
  end
end