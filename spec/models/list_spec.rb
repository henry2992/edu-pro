require 'rails_helper'

RSpec.describe List, type: :model do
  it { should have_many(:list_items) }
  it { should have_many(:attemps) }
  it { should accept_nested_attributes_for(:list_items) }
end
