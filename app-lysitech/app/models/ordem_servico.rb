class OrdemServico < ApplicationRecord
  belongs_to :perfil
  belongs_to :cliente
end
