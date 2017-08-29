module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      if @plays != [] && won?
        return false
      else
        @plays << word.upcase
        return Scoring.score(word)
      end
    end

    def total_score
      total_score = @plays.map { |word| Scoring.score(word)}.reduce(:+)
      return total_score
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    private

    def won?
      return total_score > 100
    end

  end
end
