class Issue < ApplicationRecord
  belongs_to :project
  has_many :comments,  dependent: :destroy
  validates :no, uniqueness: { scope: :project_id, message: "Same No exists in this project. Please choose another one." }
end
