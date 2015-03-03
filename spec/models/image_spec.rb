require 'rails_helper'
require 'spec_helper'
RSpec.describe Image, type: :model do
  
  it "Validations" do
    should validate_presence_of(:stock_ref)
    should validate_presence_of(:plate_reg)
    should_not allow_value("faa").for(:plate_reg)
    should allow_value("K50 WTB").for(:plate_reg)
    should allow_value("SK51 MPK").for(:plate_reg)
  end
  
end
