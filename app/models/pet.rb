class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def current_app_status

    # get application id (instance variable @application)
    # get pet id (self)
    # ActiveRecord to get that row on join table


    # require 'pry'; binding.pry 
    # application_pets = ApplicationPet.where(pet_id: self.id)
    # a = ApplicationPet.joins(:applications).where(pet_id: id).where(application_id: id)
  end

  def self.case_insenstive_search(term)
    where("lower(name) LIKE ?", "%#{term.downcase}%")
  end
end
