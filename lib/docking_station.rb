class DockingStation
    attr_reader :bike_rack
    def initialize
        @bike_rack = []
    end

    def release_bike
        return Bike.new
    end

    def dock_bike(bike)
        @bike_rack << bike
    end   
end