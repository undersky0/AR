require 'rails_helper'
require 'spec_helper'
RSpec.describe ImagesController, type: :controller do
  
  describe "GET #index JSON" do
    it "assigns all images as @images, valid request" do  
      response = get :index, {:plate_reg => "SK51 MPK", :stock_ref => "testref", :format => :json}
      expect(response.status).to eq(200)
      expect(response.message).to eq("OK")
    end
    it "assigns all images as @images, invalid request" do  
      response = get :index, {:plate_reg => nil, :stock_ref => "testref", :format => :json}
      expect(response.status).to eq(404)
    end
    it "assigns all images as @images, invalid request" do  
      response = get :index, {:plate_reg => "SK51 MPK", :stock_ref => nil, :format => :json}
      expect(response.status).to eq(404)
    end
  end
  
  describe "GET #index HTML" do
    it "assigns all images as @images, valid request" do 
      image = Imageserver.search("testref","SK51 MPK")
      get :index, {:plate_reg => "SK51 MPK", :stock_ref => "testref"}
      assigns[:images].each do |a|
        image.each do |i|
          expect(a.obfuscated).to eq(i.obfuscated)
        end         
      end
    end
   it "assigns all images and returns correct responses" do  
      get :index, {:plate_reg => "SK51 MPK", :stock_ref => "testref"}
      expect(response).to render_template("index")
      expect(flash[:notice]).to eq("Here are the images")
      expect(response.message).to eq("OK")
   end
  end
  
end
