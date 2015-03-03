#Arnold Clark test by Richard D'Lonesteen

Ruby 2.2.0 Rails 4.2.0

The app has both:

#[GUI](http://stark-headland-1205.herokuapp.com/images?utf8=%E2%9C%93&plate_reg=KK1+4KA&stock_ref=dsadas&commit=Search) and [API](http://stark-headland-1205.herokuapp.com/images.json?utf8=%E2%9C%93&plate_reg=KK1+4KA&stock_ref=dsadas&commit=Search)

It's a very simple app that gets vehicle’s registration plate and stock reference from the user and then display
all the images available for a vehicle.

The views are very simple, not even sure if it was required. A better example of web design can be found at https://github.com/undersky0/x3 ( www.undersky.co.uk ).
The app only has one model, methods of the model have been moved to services folder. The models, methods, and controllers have been tested with rspec.


