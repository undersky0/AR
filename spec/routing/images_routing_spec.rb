require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/images").to route_to("images#index")
    end
  end
end
