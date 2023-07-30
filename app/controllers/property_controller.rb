class PropertyController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # Properties endpoints
    # Get all properties including owner's contact info for each property
    get "/properties" do 
        properties = Property.all
        properties.to_json(
        only: [
            :id,
            :house_type,
            :rent,
            :rent_due_date,
            :city,
            :location,
            :building,
            :floor,
            :coordinates,
            :other_info,
            :created_at
        ],
        include: {
            owner: {
            only: [
                :name,
                :email,
                :phone
            ]
            }
        }
        )
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
        property.to_json(
        only: [
            :id,
            :house_type,
            :rent,
            :rent_due_date,
            :city,
            :location,
            :building,
            :floor,
            :coordinates,
            :other_info,
            :created_at
        ],
        include: {
            owner: {
            only: [
                :name,
                :email,
                :phone
            ]
            }
        }
        )
    end

    get "/properties/:id" do
        begin
        property = Property.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        property.to_json(
            only: [
            :id,
            :house_type,
            :rent,
            :rent_due_date,
            :city,
            :location,
            :building,
            :floor,
            :coordinates,
            :other_info,
            :created_at
            ],
            include: {
            owner: {
                only: [
                :name,
                :email,
                :phone
                ]
            }
            }
        )
        end
    end

    patch "/properties/:id" do
        begin
        property = Property.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        property.update(
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
        property.to_json(
            only: [
            :id,
            :house_type,
            :rent,
            :rent_due_date,
            :city,
            :location,
            :building,
            :floor,
            :coordinates,
            :other_info,
            :created_at
            ],
            include: {
            owner: {
                only: [
                :name,
                :email,
                :phone
                ]
            }
            }
        )
        end
    end

    delete "/properties/:id" do
        begin
        property = Property.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        property.destroy
        property.to_json(
            only: [
            :id,
            :house_type,
            :rent,
            :rent_due_date,
            :city,
            :location,
            :building,
            :floor,
            :coordinates,
            :other_info,
            :created_at
            ],
            include: {
            owner: {
                only: [
                :name,
                :email,
                :phone
                ]
            }
            }
        )
        end
    end
end