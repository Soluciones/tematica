# coding: UTF-8

FactoryGirl.define do
  factory :tematica, class: Tematica::Tematica do
    nombre        { Faker::Lorem.word }
    seccion_publi { Faker::Lorem.word }
  end
end
