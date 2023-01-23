class Issue < ApplicationRecord
  belongs_to :project
  has_many :comments
end
