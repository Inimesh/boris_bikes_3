require 'bike'

describe Bike do
    it 'tells you if the bike is working' do
		bike = Bike.new
		expect(bike.working).to eq true
	end

end
