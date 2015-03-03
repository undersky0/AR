class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  # GET /images
  # GET /images.json
  def index
    @images = Image.search(params[:stock_ref],params[:plate_reg])
    respond_to do |format|
      if @images.try(:errors)   
        format.html { flash[:error] = @images.errors.full_messages }
        format.json { render json: {errors: @images.errors.full_messages}, status: 404}
      else
        format.html { flash[:notice] = "Here are the images" }
        format.json { render json: @images, messsage: "OK", status: 200}
      end
    end    
  end

  # GET /images/1
  # GET /images/1.json
  def show
    render json: @image
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:image_size, :camera_angle, :stock_ref, :plate_reg, :obfuscated, :url)
    end
end
