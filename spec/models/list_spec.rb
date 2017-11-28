require 'rails_helper'

RSpec.describe List, type: :model do
  it { should have_many(:list_items) }
  it { should have_many(:attempts) }
  it { should accept_nested_attributes_for(:list_items) }

  context 'when there are many lists' do
  	let!(:list_one) { create(:list) }
  	let!(:list_two) { create(:list, name: "Countries") }

  	it 'sets the next list' do
  		expect(list_one.next).to eq(list_two)
  	end

  	it 'sets the previous list' do
  		expect(list_two.previous).to eq(list_one)
  	end

  	it 'sets to nil if there is not a next list' do
  		expect(list_two.next).to eq(nil)
  	end

  	it 'sets to nil if there is not a previous list' do
  		expect(list_one.previous).to eq(nil)
  	end
	end
end
