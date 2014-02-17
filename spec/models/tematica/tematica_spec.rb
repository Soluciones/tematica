# coding: UTF-8

require 'spec_helper'

describe Tematica::Tematica do
  context 'validation test' do
    it { should validate_presence_of(:nombre).with_message(/no puede estar en blanco/) }
    it { should validate_presence_of(:seccion_publi).with_message(/no puede estar en blanco/) }
  end

  describe "#to_param" do
    it "debe generar el parametro empezando por su id" do
      un_id = SecureRandom.random_number(100)
      un_nombre = Faker::Lorem.words(3).join
      una_tematica = FactoryGirl.build(:tematica, id: un_id, nombre: un_nombre)

      param = una_tematica.to_param

      param.should start_with un_id.to_s
      param.should end_with un_nombre[-1]
    end
  end

end
