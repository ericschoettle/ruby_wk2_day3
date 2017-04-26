require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
   erb(:dealerships_new)
end

get('/dealerships') do
  @dealerships = Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:dealerships) #formerly :success
end

get('/vehicles/:id') do
  # binding.pry
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  binding.pry
  erb(:vehicle)
end

get('/dealership/:id') do
  @dealership = Dealership.find(params[:id].to_i())
  erb(:dealership)
end

get('/dealership/:id/vehicles/new') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership_vehicle_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @vehicle = Vehicle.new(make, model, year)
  @vehicle.save()
  # binding.pry
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:vehicle) #formerly :success
end
