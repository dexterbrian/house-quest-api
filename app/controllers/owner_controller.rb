class OwnerController < Sinatra::Base
    set :default_content_type, 'application/json'

    # Owners endpoints
    get "/owners" do
        owners = Owner.all
        owners.to_json(
        only: [
            :id,
            :name,
            :email,
            :phone,
            :created_at
        ]
        )
    end

    post "/owners" do
        owner = Owner.create(
        name: params[:name],
        email: params[:email],
        phone: params[:phone]
        )
        owner.to_json(
        only: [
            :id,
            :name,
            :email,
            :phone,
            :created_at
        ],
        include: {
            properties: {
            only: [
                :id,
                :owner_id,
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
            ]
            }
        }
        )
    end

    get "/owners/:id" do
        begin
        owner = Owner.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        owner.to_json(
            only: [
            :id,
            :name,
            :email,
            :phone,
            :created_at
            ],
            include: {
            properties: {
                only: [
                :id,
                :owner_id,
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
                ]
            }
            }
        )
        end
    end

    patch "/owners/:id" do
        begin
        owner = Owner.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        owner.update(
            name: params[:name],
            email: params[:email],
            phone: params[:phone]
        )
        owner.to_json(
            only: [
            :id,
            :name,
            :email,
            :phone,
            :created_at
            ],
            include: {
            properties: {
                only: [
                :id,
                :owner_id,
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
                ]
            }
            }
        )
        end
    end

    delete "/owners/:id" do
        begin
        owner = Owner.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
        {
            error: true,
            message: "Record not found"
        }.to_json
        else
        owner.destroy

        # Delete properties owned by this owner
        properties = Property.where(owner_id: params[:id])
        properties.destroy_all
        
        owner.to_json(
            only: [
            :id,
            :name,
            :email,
            :phone,
            :created_at
            ],
            include: {
            properties: {
                only: [
                :id,
                :owner_id,
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
                ]
            }
            }
        )
        end
    end
end