require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus_stop')
require_relative('../person')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BusStopTest < MiniTest::Test

    def setup()
        @bus_stop = BusStop.new("Waverley")
        @person = Person.new("Mike", 35)
    end

    def test_add_person()
        @bus_stop.add_person(@person)
        assert_equal([@person], @bus_stop.queue)
    end

end