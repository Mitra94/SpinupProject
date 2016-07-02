require 'rails_helper'

RSpec.describe Micropost, type: :model do
  
  it "has none to begin with" do
    expect(Micropost.count).to eq 0
  end
  
end
