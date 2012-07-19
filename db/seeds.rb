# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Parking.delete_all
p1 = Parking.create( :name => 'Парковка ТЦ "Детский мир"', 
  :description => 'Описание парковки ТЦ "Детский мир"', 
  :address => 'Театральный пр., 5, город Москва',
  :price_per_hour => 100, :day_start => 0, :day_end => 24,
  :telephones => "79153252317\n79037430311")

p2 = Parking.create( :name => 'ТЦ "Новый колизей"', 
  :description => 'Описание парковки ТЦ "Новый колизей"', 
  :address => 'Олимпийский просп., 16 строение 1, город Москва',
  :price_per_hour => 70, :day_start => 10, :day_end => 23 ,
  :telephones => "79153252317\n79037430311")

Parking.all.each do |p| p.geocode; p.save end
