class Project < ApplicationRecord
  has_many :issues,  dependent: :destroy
  validates :name, uniqueness: { message: "Same project name exists. Please use another name." }
end
