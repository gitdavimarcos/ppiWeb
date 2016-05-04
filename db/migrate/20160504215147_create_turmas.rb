class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.references :inscricao, index: true, foreign_key: true
      t.references :curso, index: true, foreign_key: true
      t.references :professor, index: true, foreign_key: true
      t.string :turma
      t.string :sala
      t.string :data_ini
      t.string :data_ter
      t.string :turno

      t.timestamps null: false
    end
  end
end
