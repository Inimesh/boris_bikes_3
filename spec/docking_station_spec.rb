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



end