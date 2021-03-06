class Bus
    attr_reader :route_number, :destination, :passengers

    def initialize(route_number, destination)
        @route_number = route_number
        @destination = destination
        @passengers = []
    end

    def drive
        return "Brum brum"
    end

    def count_passengers()
        return @passengers.length
    end

    def pick_up(passenger)
        @passengers.push(passenger)
    end

    def drop_off(passenger)
        @passengers.delete(passenger)
    end

    def empty()
        @passengers = []
    end

    def pick_up_from_stop(bus_stop)
        for passenger in bus_stop.queue
            @passengers.push(passenger)
        end
        bus_stop.clear()
    end


end