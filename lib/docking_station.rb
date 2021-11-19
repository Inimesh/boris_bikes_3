class DockingStation
    attr_reader :bike_rack
    def initialize(capacity = 20)
        @bike_rack = []
        @capacity = capacity
    end

    def release_bike
        if is_empty?
            raise StandardError.new 'no bikes available'
        else
            return @bike_rack.pop
        end
    end

    def dock_bike(bike)
        if is_full? 
            raise StandardError.new 'rack is full!'
        end
        @bike_rack << bike
    end 
    
    private def is_empty?
         @bike_rack.length == 0
    end
    private def is_full?
          @bike_rack.length >= @capacity
    end
end