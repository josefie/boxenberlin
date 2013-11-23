# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clubs = Club.create([
  { name: 'Neuköllner Sportfreunde', contact_mail: 'info@nsf.de', password: 'password1', password_confirmation: 'password1' }, 
  { name: 'Sparta 58', contact_mail: 'info@sparta.de', password: 'password2', password_confirmation: 'password2' }, 
  { name: 'Spandauer Boxclub', contact_mail: 'info@sbc.de', password: 'password3', password_confirmation: 'password3' }, 
  { name: 'Berliner TSC', contact_mail: 'info@btsc.de', password: 'password4', password_confirmation: 'password4' }, 
  { name: 'Seitenwechsel', contact_mail: 'info@sw.de', password: 'password5', password_confirmation: 'password5' }
  ])
  
events = Event.create([
  { title: 'Boxevent Neukölln', address: 'Berlin Neukölln', date: Date.today, club_id: 1 }, 
  { title: 'Juliusturmpokalturnier', address: 'Berlin Spandau', date: Date.today, club_id: 3 }, 
  { title: 'Berliner Meisterschaft', address: 'Berlin Spandau', date: Date.today, club_id: 3 }, 
  { title: 'Johann Trollmann Boxturnier', address: 'Berlin Kreuzberg', date: Date.today, club_id: 5 }
  ])