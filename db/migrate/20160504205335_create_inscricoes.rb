class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.string :nome
      t.string :endereco
      t.string :telefone
      t.string :cidade
      t.references :curso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
