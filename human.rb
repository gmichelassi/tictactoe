require './player'

class Human < Player
  def initialize(mark:, identifier: :human)
    super
  end

  def move(board, available_spaces)
    spot = get_input(available_spaces)
    board.board[spot] = mark
  end

  private

  def get_input(available_spaces)
    input = nil

    until input
      begin
        input = Integer(gets.chomp)

        raise Error if !available_spaces.include?(input)
      rescue
        input = nil
        puts "Pick a number from #{available_spaces}"
      end
    end

    input
  end
end
