require 'rails_helper'

RSpec.describe ListItem, type: :model do
  it { should belong_to(:list) }
end
