# coding: UTF-8

module Tematica
  module TematicasHelper
    def link_borrar_o_recuperar(tematica)
      return link_to('Borrar', tematica_path(tematica), method: :delete, confirm: "¿Borrar temática #{ tematica.nombre }?") if tematica.publicado
      link_to('Recuperar', recuperar_tematica_path(tematica), method: :post)
    end
  end
end
