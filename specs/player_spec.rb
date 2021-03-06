require 'pry'
require_relative 'spec_helper'

describe "Player class" do
  before do
    @tilebag = Scrabble::TileBag.new
    @bennett = Scrabble::Player.new("Amy", @tilebag)
  end
  describe "initialize" do
    before do
      @amy = Scrabble::Player.new("Amy", @tilebag)
    end
    it "can instantiate a Player class" do
      Scrabble::Player.new("Bob", @tilebag).must_be_kind_of Scrabble::Player
    end
    it "Player can assign and access #name" do
      @amy.name.must_equal "Amy"
    end

    it "Can call an empty array on a new player" do
      @amy.plays.must_be_kind_of Array
      @amy.plays.must_be_empty
    end

    it 'draws 7 new tiles' do
      @amy.tiles.must_be_kind_of Array
      @amy.tiles.length.must_equal 7
    end
  end

  describe "play method" do
    it "adds word to plays array" do
      @bennett.play("swift")
      @bennett.plays.must_equal ["SWIFT"]
    end

    it "returns the score of the entered word" do
      @bennett.play("swift").must_equal 11
    end

    it "returns false if already won" do
      @bennett.play("zzzzzzzzzz")
      @bennett.play("a")
      @bennett.play("blah").must_equal false
    end

  end

  describe "draw_tiles method" do
    it "player responds to draw_tiles" do
      @bennett.must_respond_to :draw_tiles
    end

    it "returns three tiles if played 3 tiles" do
      @bennett.tiles = ["A", "B", "C", "D"]
      @bennett.draw_tiles(@tilebag)
      @bennett.tiles.length.must_equal 7
    end


  end

  describe "total_score method" do
    it "returns sum of all played words" do
      @bennett.play("swift")
      @bennett.play("aaa")
      @bennett.play("qz")

      @bennett.total_score.must_equal 34
    end
  end

  describe "won? method" do
    it "Player doesn't win (less than or equal to 100 points) returns false" do
      @bennett.play("aaa")
      # @bennett.won?.must_equal false
      @bennett.send(:won?).must_equal false

    end
    it "Player wins (more than 100 points) returns true" do
      @bennett.play("zzzzzzzzzz")
      @bennett.play("a")
      # @bennett.won?.must_equal true
      @bennett.send(:won?).must_equal true
    end
    it "won? is a private method" do
      @bennett.wont_respond_to :won?
    end
  end

  describe "highest_scoring_word method" do
    it "returns the player's highest_scoring_word" do
      @bennett.play("zzz")
      @bennett.play("qqq")
      @bennett.play("aaa")
      @bennett.highest_scoring_word.must_equal "ZZZ"
    end
  end

  describe "highest_word_score method" do
    it "returns the score of the highest_scoring_word" do
      @bennett.play("zzz")
      @bennett.play("qqq")
      @bennett.play("aaa")

      @bennett.highest_word_score.must_equal 30
    end
  end

end
