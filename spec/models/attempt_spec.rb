require 'rails_helper'

RSpec.describe Attempt, type: :model do
   it { should belong_to(:list) }
   it { should have_many(:answers).dependent(:destroy) }
end
