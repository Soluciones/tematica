# coding: UTF-8

class Usuario < ActiveRecord::Base
  include Tematica::Tematizable
end
