require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus')
require_relative('../person')

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

    def test_pick_up()
        @bus.pick_up(@person)
        assert_equal([@person], @bus.passengers)
    end

    def test_count_passengers()
        result = @bus.count_passengers()
        assert_equal(0, result)
    end

end
