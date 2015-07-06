# coding: UTF-8

FactoryGirl.define do
  factory :tematica, class: Tematica::Tematica do
    nombre        { FFaker::Lorem.word }
    seccion_publi { FFaker::Lorem.word }
  end
end
