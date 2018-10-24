require 'spec_helper'

describe API::Banknotes do
  include Rack::Test::Methods

  def app
    ATM::BaseAPI
  end

  context 'Banknotes API' do
    before(:each) do
      Banknote.delete_all
    end

    it 'Add banknote amount' do
      expect(Banknote.count).to be(0)
      post '/banknotes', { nominal_value: 1, amount: 10 }
      expect(last_response.status).to eq(200)
      expect(Banknote.count).to be(1)
      expect(Banknote.last.amount).to be(10)
      post '/banknotes', { nominal_value: 1, amount: 10 }
      expect(last_response.status).to eq(200)
      expect(Banknote.count).to be(1)
      expect(Banknote.last.amount).to be(20)
    end

    it 'Validation' do
      expect(Banknote.count).to be(0)
      post '/banknotes', { nominal_value: 100, amount: 10 }
      expect(last_response.status).to eq(400)
      expect(Banknote.count).to be(0)
    end
  end
end
