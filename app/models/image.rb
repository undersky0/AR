class Image < ActiveRecord::Base
  
  validates_presence_of :stock_ref, :plate_reg
  validates_length_of :plate_reg, minimum: 7, maximum:8, message: "must be between 7-8 characters long"
  #new style car plate registration regex
  #validates_format_of :plate_reg, :with => /\A([A-Za-z]{2}[ ]{0,1}[0-9]{2}[ ]{0,1}[a-zA-Z]{3})\z/

end