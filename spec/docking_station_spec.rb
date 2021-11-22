require 'docking_station'
require 'bike'

describe DockingStation do
    describe '#release_bike' do
        let(:bike) { double :bike }

        context 'bike is working' do
            before do
                allow(bike).to receive(:working).and_return(true)
            end

            it 'checks a bike is working and releases it' do
                subject.dock_bike(bike)
                released_bike = subject.release_bike
    
                expect(bike.working).to eq true
            end
          
        end

        context 'bike is broken' do
            before do
                allow(bike).to receive(:working).and_return(false)
            end

            it 'does not release a bike' do
                subject.dock_bike(bike)
                expect { subject.release_bike }.to raise_error('no working bikes available')
            end
          
        end

        it 'checks if bike rack is empty' do
            docking_station = DockingStation.new

            expect { docking_station.release_bike }.to raise_error('no bikes available')     

        end
        
    end

    describe '#dock_bike' do
        let(:bike) { double :bike }

        it 'docks a bike' do
            subject.dock_bike(bike)
    
            expect(subject.bike_rack.include?(bike)).to eq true
        end 
        
        it 'rejects bike at full capacity' do
            #create 20 bikes and dock
            20.times do
                subject.dock_bike(bike)
            end
            expect { subject.dock_bike(bike) }.to raise_error('rack is full!')
        end 
        
    end

end
