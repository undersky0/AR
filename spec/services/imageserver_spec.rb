require 'rails_helper'
require 'spec_helper'
RSpec.describe Imageserver do
  before(:each) do
    @image = FactoryGirl.build(:image)
  end
  
  describe "Method" do   
    context "OBFUSCATED" do
      it "returns obfuscated key" do
        expect(Imageserver.obfuscated_key(@image.stock_ref, @image.plate_reg)).to be_a(String)
      end
    end
    
    context "URL" do
      it "returns 12 instances=" do
        array = Imageserver.url(@image.stock_ref,@image.plate_reg)
        expect(array.count).to eq 12
      end
      
      it "returns 12 instances with valid urls" do
        array = Imageserver.url(@image.stock_ref,@image.plate_reg)
        array.each do |a|
          expect(a.url).to match a_string_starting_with(
          "http://vcache.arnoldclark.com/imageserver/#{a.obfuscated}/#{a.image_size}/#{a.camera_angle}")
        end
      end
    end
    
    context "SEARCH" do
      it "returns 12 instances with valid params" do
        array = Imageserver.search(@image.stock_ref,@image.plate_reg)
        expect(array.count).to eq 12
      end
      it "returns validation error with invalid stock param" do
        array = Imageserver.search(nil,@image.plate_reg)
        expect(array.errors.full_messages).to eq(["Stock ref can't be blank"])
      end
    end
  end
end