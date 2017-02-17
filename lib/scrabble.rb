require 'pry'

class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def score_with_multipliers(word, multipliers, word_multipler = 1)
    points = word.upcase.chars.each_with_index.map do |letter, index|
      (point_values[letter] * multipliers[index]) * word_multipler
    end

    points = points.reduce(:+)

    if word.length == 7 
      points = points + 10 * word_multipler
    end
    points
  end

  def highest_scoring_word(words)
    scores = words.each_with_index.map do |word, index|
      score(word)
    end
    words[scores.index(scores.max)]
  end


  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end

game = Scrabble.new
print game.highest_scoring_word(['hello', 'word', 'sounds'])