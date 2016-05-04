class Turma < ActiveRecord::Base
  belongs_to :inscricao
  belongs_to :curso
  belongs_to :professor
end
