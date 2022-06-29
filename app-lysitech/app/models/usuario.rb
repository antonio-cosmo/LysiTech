class Usuario < ApplicationRecord
  validates :usuario, presence: true
  validates :senha, presence: true
end
