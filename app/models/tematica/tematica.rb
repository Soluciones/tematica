# coding: UTF-8

module Tematica
  class Tematica < ActiveRecord::Base

    validates :nombre, presence: true
    validates :seccion_publi, presence: true

    def to_param
      "#{id}-#{ nombre..parameterize }"
    end

    def self.nombre(id)
      Rails.cache.fetch("tematica-nombre-#{id}") do
        Tematica.find(id).nombre
      end
    end
    
    def self.todas
      Rails.cache.fetch("tematicas") do
        Tematica.all
      end
    end
  end
end
