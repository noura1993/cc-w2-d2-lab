require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BusTest < MiniTest::Test

    def setup()
        @bus = Bus.new(22, "Ocean Terminal")
        @person = Person.new("Alice", 29)
    end

    def test_create_bus_class()
        assert_equal(22, @bus.route_number)
        assert_equal("Ocean Terminal", @bus.destination)
    end

    def test_drive()
       assert_equal("Brum brum", @bus.drive) 
    end

    def test_count_passengers()
        result = @bus.count_passengers()
        assert_equal(0, result)
    end

    def test_pick_up()
        @bus.pick_up(@person)
        assert_equal([@person], @bus.passengers)
    end

    def test_drop_off()
        @bus.drop_off(@person)
        assert_equal([], @bus.passengers)
    end

    def test_pick_up_then_drop_off()
        @bus.pick_up(@person)
        @bus.drop_off(@person)
        assert_equal([], @bus.passengers)
    end

    def test_empty()
        @bus.empty()
        assert_equal([], @bus.passengers)
    end

    def test_pick_up_from_stop()
        bus_stop = BusStop.new("Waverley")
        bus_stop.add_person(@person)
        bus_stop.add_person(@person)

        @bus.pick_up_from_stop(bus_stop)

        assert_equal([], bus_stop.queue)
        assert_equal([@person, @person], @bus.passengers)
    end

end
