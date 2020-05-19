require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class BusTest < MiniTest::Test

    def setup()
        @bus = Bus.new(22, "Ocean Terminal")
    end

    def test_create_bus_class()
        assert_equal(22, @bus.route_number)
        assert_equal("Ocean Terminal", @bus.destination)
    end

    def test_drive()
       assert_equal("Brum brum", @bus.drive) 
    end

end
