require 'rails_helper.rb'

RSpec.describe Reply, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:quote) }
  end
end