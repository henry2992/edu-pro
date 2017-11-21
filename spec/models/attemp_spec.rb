require 'rails_helper'

RSpec.describe Attemp, type: :model do
   it { should belong_to(:list) }
   it { should have_many(:answers) }
end
