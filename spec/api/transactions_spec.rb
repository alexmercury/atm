require 'spec_helper'

describe API::Transactions do
  include Rack::Test::Methods

  def app
    ATM::BaseAPI
  end

  context 'Transactions API' do
    before(:each) do
      Transaction.delete_all
      Banknote.delete_all
    end

    it 'Transactions' do
      expect(Banknote.count).to be(0)
      Banknote.create(nominal_value: 1, amount: 1)
      Banknote.create(nominal_value: 2, amount: 1)
      Banknote.create(nominal_value: 5, amount: 1)
      Banknote.create(nominal_value: 10, amount: 1)
      Banknote.create(nominal_value: 25, amount: 2)
      Banknote.create(nominal_value: 50, amount: 1)

      expect(Transaction.count).to be(0)
      post '/transactions', { total_amount: 100 }
      expect(last_response.status).to eq(200)
      expect(Transaction.count).to be(1)
      post '/transactions', { total_amount: 100 }
      expect(last_response.status).to eq(400)
      expect(Transaction.count).to be(1)
    end
  end
end
