require 'docking_station'
require 'bike'

describe DockingStation do
    it 'testing release bike' do
        docking_station = DockingStation.new
        expect(docking_station).to respond_to :release_bike
    end

    it 'releases a bike and checks its working' do
        docking_station = DockingStation.new
        bike = docking_station.release_bike
        expect(bike).to be_instance_of(Bike)
        expect(bike.working?).to eq true
    end

    it 'docks a bike' do
        # Set up
        docking_station = DockingStation.new
        bike = docking_station.release_bike

        # Does the method even exist?
        expect(docking_station).to respond_to :dock_bike

        # testing
        previous_length = docking_station.bike_rack.length
        # dock the bike
        docking_station.dock_bike(bike)

        expect(docking_station.bike_rack.length).to eq previous_length + 1
    end   
end