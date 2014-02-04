class CreateTematicaTematizaciones < ActiveRecord::Migration
  def change
    create_table :tematica_tematizaciones do |t|
      t.integer :tematizable_id
      t.string :tematizable_type
      t.string :tematizable_grupo # Lo usaremos para más detalles, p.ej. en contenidos guardaremos la clase, en usuario si es experto...
      t.integer :tematica_id
      t.boolean :explicita

      t.timestamps
    end
    add_index :tematica_tematizaciones, [:tematizable_type, :tematizable_id], name: 'ix_tematizaciones_by_tematizable'
    add_index :tematica_tematizaciones, [:tematica_id, :tematizable_type, :tematizable_grupo], name: 'ix_tematizaciones_by_tematica_and_type_grupo'
  end
end
