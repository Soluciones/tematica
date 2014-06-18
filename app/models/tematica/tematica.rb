# coding: UTF-8

class Tematica::Tematica < ActiveRecord::Base
  include Tematica::TematicaBase
  scope :publicado, -> { where(publicado: true) }
end
