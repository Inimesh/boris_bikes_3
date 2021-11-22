require 'docking_station'
require 'bike'

describe DockingStation do
    describe '#release_bike' do
    
        it 'checks a bike is working and releases it' do
            docking_station = DockingStation.new
            bike = Bike.new
            docking_station.dock_bike(bike)
            expect(docking_station.release_bike).to eq bike
        end

        it 'checks if bike rack is empty' do
            docking_station = DockingStation.new

            expect { docking_station.release_bike }.to raise_error('no bikes available')     

        end
        context 'bike is broken' do
            it 'does not release a bike' do
                docking_station = DockingStation.new
                bike = Bike.new
    
                bike.working = false
                docking_station.dock_bike(bike)

                expect { docking_station.release_bike }.to raise_error('no working bikes available')
            end
          
        end
        
    end

    describe '#dock_bike' do
        it 'docks a bike' do
            # Set up
            docking_station = DockingStation.new
            
            bike = Bike.new
    
            docking_station.dock_bike(bike)
    
            # Does the method even exist?
            expect(docking_station).to respond_to :dock_bike
    
            # testing
            previous_length = docking_station.bike_rack.length
            # dock the bike
            docking_station.dock_bike(bike)
    
            expect(docking_station.bike_rack.length).to eq previous_length + 1
        end 
        
        it 'rejects bike at full capacity' do
            docking_station = DockingStation.new

            #create 20 bikes and dock
            20.times do
                bike = Bike.new
                docking_station.dock_bike(bike)
            end
            bike = Bike.new
            expect { docking_station.dock_bike(bike) }.to raise_error('rack is full!')
        end  
    end

    

end