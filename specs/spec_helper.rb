require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/scoring'
require_relative '../lib/player'
require_relative '../lib/tilebag'
require_relative '../lib/game'
#
#
#
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
