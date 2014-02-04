# coding: UTF-8

module Tematica
  class Tematica < ActiveRecord::Base

    TEMATICAS = [ 1 => 'Depósitos y cuentas',
                  2 => 'Fondos',
                  3 => 'Hipotecas',
                  4 => 'Renta fija',
                  5 => 'Seguros',
                  6 => 'Bolsa',
                  7 => 'Forex',
                  8 => 'Futuros',
                  9 => 'Materias primas',
                 10 => 'Opciones',
                 11 => 'Sistemas de trading',
                 12 => 'Fiscalidad']

    def nombre(id)
      TEMATICAS[id]
    end
  end
end
