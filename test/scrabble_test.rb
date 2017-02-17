gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_with_multiplier
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 14, Scrabble.new.score_with_multipliers('banana', [2,1,1,4,1,1])
  end

  def test_it_can_score_with_word_multiplier
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 28, Scrabble.new.score_with_multipliers('banana', [2,1,1,4,1,1], 2)
  end

  def test_10_point_bonus_if_length_is_7
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 28, Scrabble.new.score_with_multipliers('banana', [2,1,1,4,1,1], 2)
  end

  def test_highest_scoring_word
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_highest_scoring_word_prioritizes_short
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
  end

end
