class Fortune < ApplicationRecord
  validates :name, {presence: true}
  validates :birthday, {presence: true}
  validates :gender, {presence: true}
  validates :like, {presence: true}
end
