class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :application_pets, dependent: :delete_all
  has_many :applications, through: :application_pets, dependent: :delete_all

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.case_insensitive_search(term)
    where("lower(name) LIKE ?", "%#{term.downcase}%")
  end
end
