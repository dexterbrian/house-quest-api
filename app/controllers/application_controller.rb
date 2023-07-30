class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # Properties endpoints
  get "/properties" do 
    properties = Property.all
    properties.to_json
  end

  post "/properties" do
    property = Property.create(
      owner_id: params[:owner_id],
      house_type: params[:house_type],
      rent: params[:rent],
      rent_due_date: params[:rent_due_date],
      city: params[:city],
      location: params[:location],
      building: params[:building],
      floor: params[:floor],
      coordinates: params[:coordinates],
      other_info: params[:other_info]
    )
    property.to_json
  end

  get "/properties/:id" do
    property = Property.find(params[:id])
    property.to_json
  end

  # Owners endpoints
  get "/owners" do
    owners = Owner.all
    owners.to_json
  end

  post "/owners" do
    owner = Owner.create(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    owner.to_json
  end

  get "/owners/:id" do
    owner = Owner.find(params[:id])
    owner.to_json
  end

end
