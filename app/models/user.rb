class User < ApplicationRecord
  require "open-uri"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_properties, through: :wishlists, source: :property, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :reserved_properties, through: :reservations, source: :property, dependent: :destroy

  has_many :payments, through: :reservations, dependent: :destroy

  after_create :new_profile

  def new_profile
    profile = self.create_profile!(
      name: Faker::Lorem.unique.sentence(word_count: 3),
      address_1: Faker::Address.street_address,
      address_2: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country_code: Faker::Address.country_code,
    )
    profile.picture.attach(
      io: URI.parse(Faker::LoremFlickr.image).open,
      filename: "#{profile.name}.jpg",
    )
  end
end
