# coding: UTF-8

class CreateTematicaTematicas < ActiveRecord::Migration
  def self.up
    create_table :tematicas do |t|
      t.string :nombre
      t.string :seccion_publi

      t.timestamps
    end
  end

  def self.down
    drop_table :tematicas
  end
end
