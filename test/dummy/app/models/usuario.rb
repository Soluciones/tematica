# coding: UTF-8

class Usuario < ActiveRecord::Base
  has_many :tematizaciones, as: :tematizable , class_name: 'Tematica::Tematizacion'

end
