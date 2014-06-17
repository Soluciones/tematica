# coding: UTF-8

class Tematica::Tematica < ActiveRecord::Base
  include Tematica::TematicaBase
  default_scope order('publicado DESC, nombre')
end
