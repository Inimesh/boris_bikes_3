class DockingStation
    attr_reader :bike_rack
    def initialize(capacity = 11)
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
        if bike_rack.length >= @capacity
            raise StandardError.new 'rack is full!'
        end 
        @bike_rack << bike
    end 
    
    def is_empty?
        if @bike_rack.length == 0
            return true
        else
            return false
        end
    end
end