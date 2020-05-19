require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BusTest < MiniTest::Test


end
