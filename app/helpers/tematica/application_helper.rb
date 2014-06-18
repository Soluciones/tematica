module Tematica
  module ApplicationHelper
    def desplegable_tematicas
      tematica_collection = Tematica.kind_of?(Module) ? Tematica::Tematica : Tematica
      tematica_collection.publicado.all.collect{ |tematica| [tematica.nombre, tematica.id] }
    end
  end
end
