# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clubs = Club.create!([
  
  # Beispielvereine
  { name: 'Neuköllner Sportfreunde', contact_mail: 'info@nsf.de', password: 'password1', password_confirmation: 'password1' }, 
  { name: 'Sparta 58', contact_mail: 'info@sparta.de', password: 'password2', password_confirmation: 'password2' }, 
  { name: 'Spandauer Boxclub', contact_mail: 'info@sbc.de', password: 'password3', password_confirmation: 'password3' }, 
  { name: 'Berliner TSC', contact_mail: 'info@btsc.de', password: 'password4', password_confirmation: 'password4' }, 
  { name: 'Seitenwechsel', contact_mail: 'info@sw.de', password: 'password5', password_confirmation: 'password5' }
  
  ])

schedule_items = ScheduleItem.create!([
  
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 1 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 2 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 3 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 4 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 5 }
  
  ])
  
events = Event.create!([
  
  # Beispielveranstaltungen
  { title: 'Boxevent Neukölln', date: Date.parse("2013-01-10"), contact_name: "A", contact_mail: "info@nsf.de", club_id: 1, approved: false }, 
  { title: 'Juliusturmpokalturnier', date: Date.parse("2014-02-01"), contact_name: "B", contact_mail: "info@sbc.de", club_id: 3, approved: true }, 
  { title: 'Berliner Meisterschaft', date: Date.parse("2013-01-15"), contact_name: "B", contact_mail: "info@sbc.de", club_id: 3, approved: true }, 
  { title: 'Johann Trollmann Boxturnier', date: Date.today, contact_name: "C", contact_mail: "info@sw.de", club_id: 5, approved: true },
  { title: 'Neujahrsboxen', date: Date.parse("2014-01-01"), contact_name: "C", contact_mail: "info@sw.de", club_id: 5 }
  
  ])

  
### ALTERSKLASSEN ###

age_classes_1 = PerformanceClass.create!([
  # Schüler und Kadetten
  schueler_c = { title: 'Schüler C', age_min: 6, age_max: 7, gender: false }, 
  schueler_b = { title: 'Schüler B', age_min: 8, age_max: 9, gender: false }, 
  schueler_a = { title: 'Schüler A', age_min: 10, age_max: 11, gender: false }, 
  kadetten = { title: 'Kadetten (U15)', age_min: 12, age_max: 14, gender: false }
  ])

age_classes_2 = PerformanceClass.create!([
  # Junioren
  junioren = { title: 'Junioren (U17)', age_min: 15, age_max: 16, gender: false }
  ])
  
age_classes_3 = PerformanceClass.create!([
  # männliche Jugend und Männer
  m_jugend = { title: 'männliche Jugend (U19)', age_min: 17, age_max: 18, gender: false }, 
  maenner = { title: 'Männer', age_min: 19, age_max: 37, gender: false }
  ])
  
age_classes_4 = PerformanceClass.create!([
  # Schülerinnen und Kadettinnen
  { title: 'Schülerinnen C', age_min: 6, age_max: 7, gender: true }, 
  { title: 'Schülerinnen B', age_min: 8, age_max: 9, gender: true }, 
  { title: 'Schülerinnen A', age_min: 10, age_max: 11, gender: true }, 
  { title: 'Kadettinnen (U15)', age_min: 12, age_max: 14, gender: true }, 
  ])
  
age_classes_5 = PerformanceClass.create!([
  # Juniorinnen
  { title: 'Juniorinnen (U17)', age_min: 15, age_max: 16, gender: true }
  ])
  
age_classes_6 = PerformanceClass.create!([
  # weibliche Jugend und Frauen 
  { title: 'weibliche Jugend (U19)', age_min: 17, age_max: 18, gender: true }, 
  { title: 'Frauen', age_min: 19, age_max: 37, gender: true }
  ])
  
######

### LEISTUNGSKLASSEN ###

performance_classes = PerformanceClass.create!([
  lk_c = { title: 'Leistungsklasse C', age_min: 6, age_max: 37, win_min: 0, win_max: 6 }, 
  lk_b = { title: 'Leistungsklasse B', age_min: 6, age_max: 37, win_min: 7, win_max: 14 }, 
  lk_a = { title: 'Leistungsklasse A', age_min: 6, age_max: 17, win_min: 15, win_max: 1000 }, 
  elite = { title: 'Elite', age_min: 18, age_max: 37, win_min: 26, win_max: 1000 }
])

######

### WEEKDAYS ###

weekdays = Weekday.create!([
  { name: I18n.t(:mon) },
  { name: I18n.t(:tue) },
  { name: I18n.t(:wed) },
  { name: I18n.t(:thu) },
  { name: I18n.t(:fri) },
  { name: I18n.t(:sat) },
  { name: I18n.t(:sun) }
  ])

######
