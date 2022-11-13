class Settings
  def initialize
    @game_mode = choose_game_mode
  end

  def setup_player_one
    puts "Player one settings"
    return setup_human_player("X") if [1, 2].include?(game_mode)

    setup_computer_player("X", 1)
  end

  def setup_player_two
    puts "Player two settings"
    return setup_computer_player("O", 2) if [2, 3].include?(game_mode)

    setup_human_player("O")
  end

  private

  attr_reader :game_mode

  def choose_game_mode
    puts "Select the gamemode you want to play:"
    show_game_mode_options

    input = nil

    until input
      begin
        input = Integer(gets.chomp)
        raise Error if ![1, 2, 3].include?(input)
      rescue
        input = nil
        puts "Pick a number [1-3]"
        show_game_mode_options
      end
    end

    input
  end

  def show_game_mode_options
    puts "1. Human    (X) vs Human    (O)"
    puts "2. Human    (X) vs Computer (O)"
    puts "3. Computer (X) vs Computer (O)"
  end

  def setup_human_player(mark)
    puts "Type your name:"
    name = gets.chomp

    ::Human.new(mark: mark, name: name)
  end

  def setup_computer_player(mark, id)
    puts "Select Computer #{1}'s level: "
    show_computer_difficulty_level

    difficulty = nil

    until difficulty
      begin
        difficulty = Integer(gets.chomp)
        raise Error if ![1, 2].include?(difficulty)
      rescue
        difficulty = nil
        puts "Pick a number [1-2]"
        show_computer_difficulty_level
      end
    end

    ::Computer.new(mark: mark, name: "Computer #{id}", difficulty: difficulty)
  end

  def show_computer_difficulty_level
    puts "1. Easy"
    puts "2. Hard"
  end
end