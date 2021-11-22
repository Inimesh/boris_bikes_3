class DockingStation
    attr_reader :bike_rack
    def initialize(capacity = 20)
        @bike_rack = []
        @capacity = capacity
    end

    def release_bike
        if is_empty?
            raise StandardError.new 'no bikes available'
        end

        @bike_rack.each do |bike|
            if bike.working == true
                return @bike_rack.delete(bike)
            end
        end

        raise StandardError.new 'no working bikes available'
    end

    def dock_bike(bike)
        if is_full?
            raise StandardError.new 'rack is full!'
        end
        @bike_rack << bike
    end 
    
    def is_empty?
         @bike_rack.length == 0
    end

    def is_full?
          @bike_rack.length >= @capacity
    end
end