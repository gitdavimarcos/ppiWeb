class Nota < ActiveRecord::Base
  belongs_to :inscricao
  belongs_to :curso
end
