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
   
  before(:each) do
    @image = FactoryGirl.build(:image)
  end
  
  describe "Method" do   
    context "OBFUSCATED" do
      it "returns obfuscated key" do
        expect(Image.obfuscated_key(@image.stock_ref, @image.plate_reg)).to be_a(String)
      end
    end
    
    context "URL" do
      it "returns 12 instances=" do
        array = Image.url(@image.stock_ref,@image.plate_reg)
        expect(array.count).to eq 12
      end
      
      it "returns 12 instances with valid urls" do
        array = Image.url(@image.stock_ref,@image.plate_reg)
        array.each do |a|
          expect(a.url).to match a_string_starting_with(
          "http://vcache.arnoldclark.com/imageserver/#{a.obfuscated}/#{a.image_size}/#{a.camera_angle}")
        end
      end
    end
    
    context "SEARCH" do
      it "returns 12 instances with valid params" do
        array = Image.search(@image.stock_ref,@image.plate_reg)
        expect(array.count).to eq 12
      end
      it "returns validation error with invalid stock param" do
        array = Image.search(nil,@image.plate_reg)
        expect(array.errors.full_messages).to eq(["Stock ref can't be blank"])
      end
    end
  end
end
