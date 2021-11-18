class DockingStation
    attr_reader :bike_rack
    def initialize(capacity=20)
        @DEFAULT_CAPACITY = capacity
        @bike_rack = []
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
    
    private
    def is_empty?
        if @bike_rack.length == 0
            return true
        else
            return false
        end
    end
    def is_full?
        if @bike_rack.length >= @DEFAULT_CAPACITY
            return true
        else
            return false
        end
    end
end