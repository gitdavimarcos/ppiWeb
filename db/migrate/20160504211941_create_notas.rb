class CreateNotas < ActiveRecord::Migration
  def change
    create_table :notas do |t|
      t.references :inscricao, index: true, foreign_key: true
      t.references :curso, index: true, foreign_key: true
      t.float :nota
      t.string :frequencia

      t.timestamps null: false
    end
  end
end
