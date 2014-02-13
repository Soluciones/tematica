class AddPortadaPathToTematica < ActiveRecord::Migration
  def change
    add_column :tematica_tematicas, :portada_path, :string, after: 'nombre'
  end
end
