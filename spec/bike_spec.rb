require 'bike'

describe Bike do
    it 'responds to the method working?' do
        bike = Bike.new
        expect(bike).to respond_to :working?
    end

    it 'tells you if the bike is working' do
		bike = Bike.new
		bike.working?
		expect(bike.working?).to eq true
	end
end