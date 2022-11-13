class Board
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  attr_reader :board

  def show
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def game_is_tied?
    board.all? { |position| position == "X" || position == "O" }
  end

  def game_is_over?
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def get_random_move
    n = rand(0..available_spaces.count)

    return available_spaces[n].to_i
  end

  def get_best_move(first_player_mark, second_player_mark)
    best_move = nil
    
    available_spaces.each do |space|
      board[space] = first_player_mark
      if game_is_over?
        best_move = space
        board[space] = space
        return best_move
      else
        board[space] = second_player_mark
        if game_is_over?
          best_move = space
          board[space] = space
          return best_move
        else
          board[space] = space
        end
      end
    end

    best_move || get_random_move
  end

  def available_spaces
    board.map.with_index do |position, index|
      index if position != "X" && position != "O"
    end.compact
  end

  def get_winner_mark
    return if !game_is_over?

    return board[0] if [board[0], board[1], board[2]].uniq.length == 1
    return board[3] if [board[3], board[4], board[5]].uniq.length == 1
    return board[6] if [board[6], board[7], board[8]].uniq.length == 1
    return board[0] if [board[0], board[3], board[6]].uniq.length == 1
    return board[1] if [board[1], board[4], board[7]].uniq.length == 1
    return board[2] if [board[2], board[5], board[8]].uniq.length == 1
    return board[0] if [board[0], board[4], board[8]].uniq.length == 1
    return board[2] if [board[2], board[4], board[6]].uniq.length == 1
  end
end