# coding: UTF-8

FactoryGirl.define do
  factory :tematizacion, class: 'Tematica::Tematizacion' do
    # association :tematizable
    tematica_id { rand(12) + 1 }
  end
end
