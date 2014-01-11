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
  { name: 'Berliner Boxverband', contact_mail: 'bbv@web.de', password: 'pw1', password_confirmation: 'pw1' },
  { name: 'SV Blau-Gelb', contact_mail: 'a.freiwald@web.de', password: 'pw2', password_confirmation: 'pw2' }, 
  { name: 'Spandauer BC 26', contact_mail: 'box_info.bbv@t-online.de', password: 'pw3', password_confirmation: 'pw3' }, 
  { name: 'Boxring Hertha BSC', contact_mail: 'info@herthabsc.de', password: 'pw4', password_confirmation: 'pw4' }, 
  { name: 'SV Astoria', contact_mail: 'Senol.Ercel@gmx.de', password: 'pw5', password_confirmation: 'pw5' }
  
  ])

locations = Location.create!([
  
  { city: 'Berlin', event_id: 1 },
  { city: 'Berlin', event_id: 2 },
  { city: 'Berlin', event_id: 3 },
  { city: 'Berlin', event_id: 4 },
  { city: 'Berlin', event_id: 5 },
  { city: 'Berlin', event_id: 6 },
  { city: 'Berlin', event_id: 7 },
  { city: 'Berlin', event_id: 8 },
  { city: 'Berlin', event_id: 9 },
  { city: 'Berlin', event_id: 10 },
  { city: 'Berlin', event_id: 11 }
  
  ])
  
schedule_items = ScheduleItem.create!([
  
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 1 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 2 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 3 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 4 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 5 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 6 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 7 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 8 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 9 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 10 },
  { label: 'Beginn', time: Time.parse("10:00"), event_id: 11 }
  
  ])
  
events = Event.create!([
  
  # Beispielveranstaltungen
  { title: 'Boxveranstaltung', date: Date.parse("2014-01-25"), club_id: 2, approved: true, contact_mail: clubs[1].contact_mail }, 
  { title: 'Boxveranstaltung', date: Date.parse("2014-02-02"), club_id: 3, approved: true, contact_mail: clubs[2].contact_mail }, 
  { title: 'BL in Herzberg', date: Date.parse("2014-02-14"), club_id: 4, approved: true, contact_mail: clubs[3].contact_mail }, 
  { title: 'BL in Berlin', date: Date.parse("2014-02-22"), club_id: 4, approved: true, contact_mail: clubs[3].contact_mail }, 
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-01"), club_id: 4, approved: true, contact_mail: clubs[3].contact_mail },
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-02"), club_id: 4, approved: true, contact_mail: clubs[3].contact_mail },
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-08"), club_id: 5, approved: true, contact_mail: clubs[4].contact_mail },
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-09"), club_id: 5, approved: true, contact_mail: clubs[4].contact_mail },
  { title: 'Landesmeisterschaft U17/U19', date: Date.parse("2014-03-21"), club_id: 1, approved: true, contact_mail: clubs[0].contact_mail },
  { title: 'Boxen International', date: Date.parse("2014-04-08"), club_id: 1, approved: true, contact_mail: clubs[0].contact_mail },
  { title: 'Landesmeisterschaft U13/U15', date: Date.parse("2014-04-11"), club_id: 1, approved: true, contact_mail: clubs[0].contact_mail }

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
  { name: I18n.t('weekdays.mon') },
  { name: I18n.t('weekdays.tue') },
  { name: I18n.t('weekdays.wed') },
  { name: I18n.t('weekdays.thu') },
  { name: I18n.t('weekdays.fri') },
  { name: I18n.t('weekdays.sat') },
  { name: I18n.t('weekdays.sun') }
  ])

######
