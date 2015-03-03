class ImagesController < ApplicationController
  
  # GET /images
  # GET /images.json
  def index
    @images = Imageserver.search(params[:stock_ref],params[:plate_reg])
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
  
  private
  
  def image_params
    params.require(:image).permit(:stock_ref, :plate_reg)
  end
  
end
