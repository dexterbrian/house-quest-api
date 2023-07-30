puts "🌱 Seeding houses..."

house_types = [
    "Bedsitter",
    "One Bedroom",
    "Two Bedroom",
    "Three Bedroom"
]

house_prices = [
    6500,
    20000,
    16000,
    30000    
]

house_locations = [
    "Kasarani",
    "Westlands",
    "Buruburu",
    "Pangani"
]

# Faker::Config.locale = 'en-KE'

# Seed your database here
6.times do |i|

    # Seeding owners
    owner = Owner.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164
    )

    # Seeding properties
    4.times do |i|
        random_number = rand(0..3)
        property = Property.create(
            owner_id: owner.id,
            house_type: house_types[random_number],
            rent: house_prices[random_number],
            rent_due_date: rand(5..10),
            city: "Nairobi",
            location: house_locations[random_number],
            building: Faker::Address.community,
            floor: rand(0..5),
            coordinates: Faker::Internet.url,
            other_info: Faker::Lorem.paragraph
        )
    end
end

puts "✅ Done seeding!"
