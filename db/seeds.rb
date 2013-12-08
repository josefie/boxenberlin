# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clubs = Club.create([
  
  # Beispielvereine
  { name: 'Neuköllner Sportfreunde', contact_mail: 'info@nsf.de', password: 'password1', password_confirmation: 'password1' }, 
  { name: 'Sparta 58', contact_mail: 'info@sparta.de', password: 'password2', password_confirmation: 'password2' }, 
  { name: 'Spandauer Boxclub', contact_mail: 'info@sbc.de', password: 'password3', password_confirmation: 'password3' }, 
  { name: 'Berliner TSC', contact_mail: 'info@btsc.de', password: 'password4', password_confirmation: 'password4' }, 
  { name: 'Seitenwechsel', contact_mail: 'info@sw.de', password: 'password5', password_confirmation: 'password5' }
  
  ])
  
events = Event.create([
  
  # Beispielveranstaltungen
  { title: 'Boxevent Neukölln', address: 'Berlin Neukölln', date: Date.parse("2013-12-10"), club_id: 1, approved: false }, 
  { title: 'Juliusturmpokalturnier', address: 'Berlin Spandau', date: Date.parse("2014-02-01"), club_id: 3, approved: true }, 
  { title: 'Berliner Meisterschaft', address: 'Berlin Spandau', date: Date.parse("2013-12-15"), club_id: 3, approved: true }, 
  { title: 'Johann Trollmann Boxturnier', address: 'Berlin Kreuzberg', date: Date.today, club_id: 5, approved: true },
  { title: 'Neujahrsboxen', address: 'Berlin Kreuzberg', date: Date.parse("2014-01-01"), club_id: 5 }
  
  ])
  
### ALTERSKLASSEN ###

age_classes_1 = PerformanceClass.create([
  # Schüler und Kadetten
  schueler_c = { title: 'Schüler C', age_min: 6, age_max: 7, gender: false }, 
  schueler_b = { title: 'Schüler B', age_min: 8, age_max: 9, gender: false }, 
  schueler_a = { title: 'Schüler A', age_min: 10, age_max: 11, gender: false }, 
  kadetten = { title: 'Kadetten (U15)', age_min: 12, age_max: 14, gender: false }
  ])

age_classes_2 = PerformanceClass.create([
  # Junioren
  junioren = { title: 'Junioren (U17)', age_min: 15, age_max: 16, gender: false }
  ])
  
age_classes_3 = PerformanceClass.create([
  # männliche Jugend und Männer
  m_jugend = { title: 'männliche Jugend (U19)', age_min: 17, age_max: 18, gender: false }, 
  maenner = { title: 'Männer', age_min: 19, age_max: 37, gender: false }
  ])
  
age_classes_4 = PerformanceClass.create([
  # Schülerinnen und Kadettinnen
  { title: 'Schülerinnen C', age_min: 6, age_max: 7, gender: true }, 
  { title: 'Schülerinnen B', age_min: 8, age_max: 9, gender: true }, 
  { title: 'Schülerinnen A', age_min: 10, age_max: 11, gender: true }, 
  { title: 'Kadettinnen (U15)', age_min: 12, age_max: 14, gender: true }, 
  ])
  
age_classes_5 = PerformanceClass.create([
  # Juniorinnen
  { title: 'Juniorinnen (U17)', age_min: 15, age_max: 16, gender: true }
  ])
  
age_classes_6 = PerformanceClass.create([
  # weibliche Jugend und Frauen 
  { title: 'weibliche Jugend (U19)', age_min: 17, age_max: 18, gender: true }, 
  { title: 'Frauen', age_min: 19, age_max: 37, gender: true }
  ])
  
######

### WEEKDAYS ###

weekdays = Weekday.create([
  { name: I18n.t(:mon) },
  { name: I18n.t(:tue) },
  { name: I18n.t(:wed) },
  { name: I18n.t(:thu) },
  { name: I18n.t(:fri) },
  { name: I18n.t(:sat) },
  { name: I18n.t(:sun) }
  ])

######






=begin
  
# Alle Leistungsklassen

pcs = [[[]]]

pcs[0] = Hash.new( gender: false )
pcs[1] = Hash.new( gender: true )

# Altersklassen

pcs[0,0] = Hash.new( title: 'Schüler C', age_min: 6, age_max: 7 )
pcs[0,1] = Hash.new( title: 'Schüler B', age_min: 8, age_max: 9 )
pcs[0,2] = Hash.new( title: 'Schüler A', age_min: 10, age_max: 11 )
pcs[0,3] = Hash.new( title: 'Kadetten (U15)', age_min: 12, age_max: 14 )
pcs[0,4] = Hash.new( title: 'Junioren (U17)', age_min: 15, age_max: 16 )
pcs[0,5] = Hash.new( title: 'männliche Jugend (U19)', age_min: 17, age_max: 18 )
pcs[0,6] = Hash.new( title: 'Männer', age_min: 19, age_max: 37 )

pcs[1,0] = Hash.new( title: 'Schülerinnen C', age_min: 6, age_max: 7 )
pcs[1,1] = Hash.new( title: 'Schülerinnen B', age_min: 8, age_max: 9 ) 
pcs[1,2] = Hash.new( title: 'Schülerinnen A', age_min: 10, age_max: 11 )
pcs[1,3] = Hash.new( title: 'Kadettinnen (U15)', age_min: 12, age_max: 14 )
pcs[1,4] = Hash.new( title: 'Juniorinnen (U17)', age_min: 15, age_max: 16 )
pcs[1,5] = Hash.new( title: 'weibliche Jugend (U19)', age_min: 17, age_max: 18 )
pcs[1,6] = Hash.new( title: 'Frauen', age_min: 19, age_max: 37 )


# Gewichtsklassen

pcs[0,0,0] = Hash.new( weight_min: 0, weight_max: 32 )
pcs[0,0,1] = Hash.new( weight_min: 33, weight_max: 34 )
pcs[0,0,2] = Hash.new( weight_min: 35, weight_max: 36 )
pcs[0,0,3] = Hash.new( weight_min: 37, weight_max: 38 )
pcs[0,0,4] = Hash.new( weight_min: 39, weight_max: 40 )
pcs[0,0,5] = Hash.new( weight_min: 41, weight_max: 42 )
pcs[0,0,6] = Hash.new( weight_min: 43, weight_max: 44 )
pcs[0,0,7] = Hash.new( weight_min: 45, weight_max: 46 )
pcs[0,0,8] = Hash.new( weight_min: 47, weight_max: 48 )
pcs[0,0,9] = Hash.new( weight_min: 37, weight_max: 38 )

pcs.each do |gender|
  gender.each do |age|
    #age.each do |weight|
      #hash = gender.merge(age.merge(weight))
      hash = gender.merge(age)
      puts hash
      PerformanceClass.create( hash )
    #end
  end
end

=end
  
=begin
  age_classes.each do |ac|
    13.times do |i|
      WeightClass.create({ title: "#{ac.title} - Klasse #{i}", weight_min: i*2+28, weight_max: i*2+30 })
    end
  end
=end

=begin
  # Gewichtsklassen der männlichen Schüler und Kadetten
  
  schueler_kadetten_m = WeightClass.create([{ title: 'Papier', weight_min: 0, weight_max: 32, gender: false }])
  
  $weight = 33
  
  while $weight <= 46 do
    schueler_kadetten_m << WeightClass.create({ title: 'Papier', weight_min: $weight, weight_max: $weight + 1, gender: false })
    $weight += 2
  end
  
  while $weight <= 54 do
    schueler_kadetten_m << WeightClass.create({ title: 'Halbfliegen +', weight_min: $weight, weight_max: $weight + 1, gender: false })
    $weight += 2
  end
  
  while $weight <= 66 do
    schueler_kadetten_m << WeightClass.create({ title: 'Leicht +', weight_min: $weight, weight_max: $weight + 2, gender: false})
    $weight += 3
  end
  
  schueler_kadetten_m << WeightClass.create([
    { title: 'Mittel', weight_min: 67, weight_max: 70, gender: false },
    { title: 'Halbschwer', weight_min: 71, weight_max: 75, gender: false },
    { title: 'Schwer', weight_min: 76, weight_max: 80, gender: false },
    { title: 'Superschwer', weight_min: 81, weight_max: 300, gender: false }
  ])
=end
    

=begin
PerformanceClass.create([

  # Gewichtsklassen der männlichen Schüler und Kadetten
  { title: 'Papier', weight_min: 0, weight_max: 32, gender: false }, 
  { title: 'Halbfliegen', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Fliegen', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Bantam', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Feder', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Leicht', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Halbwelter', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Welter', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Halbmittel', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Mittel', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Halbschwer', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Schwer', weight_min: 0, weight_max: 32, gender: false },
  { title: 'Superschwer', weight_min: 0, weight_max: 32, gender: false }
  
  ])
=end

=begin
weight_classes_schueler_kadetten_f = WeightClass.create([
    
  # Gewichtsklassen der weiblichen Schüler und Kadetten
  { title: 'Papier' }, 
  { title: 'Halbfliegen' }, 
  { title: 'Fliegen' }, 
  { title: 'Bantam' }, 
  { title: 'Feder' }, 
  { title: 'Leicht' }, 
  { title: 'Halbwelter' }, 
  { title: 'Welter' }, 
  { title: 'Halbmittel' }, 
  { title: 'Mittel' }, 
  { title: 'Halbschwer' }, 
  { title: 'Schwer' },
  { title: 'Superschwer' }
  
  ])
  
weight_classes_junioren_m = WeightClass.create([
    
  # Gewichtsklassen der männlichen Junioren
  { title: 'Papier' }, 
  { title: 'Halbfliegen' }, 
  { title: 'Fliegen' }, 
  { title: 'Bantam' }, 
  { title: 'Feder' }, 
  { title: 'Leicht' }, 
  { title: 'Halbwelter' }, 
  { title: 'Welter' }, 
  { title: 'Halbmittel' }, 
  { title: 'Mittel' }, 
  { title: 'Halbschwer' }, 
  { title: 'Schwer' },
  { title: 'Superschwer' }
  
  ])
  
weight_classes_junioren_f = WeightClass.create([
    
  # Gewichtsklassen der weiblichen Junioren
  { title: 'Papier' }, 
  { title: 'Halbfliegen' }, 
  { title: 'Fliegen' }, 
  { title: 'Bantam' }, 
  { title: 'Feder' }, 
  { title: 'Leicht' }, 
  { title: 'Halbwelter' }, 
  { title: 'Welter' }, 
  { title: 'Halbmittel' }, 
  { title: 'Mittel' }, 
  { title: 'Halbschwer' }, 
  { title: 'Schwer' },
  { title: 'Superschwer' }
  
  ])
  
weight_classes_jugend_maenner = WeightClass.create([
    
  # Gewichtsklassen der männlichen Jugend und Männer
  { title: 'Papier' }, 
  { title: 'Halbfliegen' }, 
  { title: 'Fliegen' }, 
  { title: 'Bantam' }, 
  { title: 'Feder' }, 
  { title: 'Leicht' }, 
  { title: 'Halbwelter' }, 
  { title: 'Welter' }, 
  { title: 'Halbmittel' }, 
  { title: 'Mittel' }, 
  { title: 'Halbschwer' }, 
  { title: 'Schwer' },
  { title: 'Superschwer' }
  
  ])
  
weight_classes_jugend_frauen = WeightClass.create([
    
  # Gewichtsklassen der weiblichen Jugend und Frauen
  { title: 'Papier' }, 
  { title: 'Halbfliegen' }, 
  { title: 'Fliegen' }, 
  { title: 'Bantam' }, 
  { title: 'Feder' }, 
  { title: 'Leicht' }, 
  { title: 'Halbwelter' }, 
  { title: 'Welter' }, 
  { title: 'Halbmittel' }, 
  { title: 'Mittel' }, 
  { title: 'Halbschwer' }, 
  { title: 'Schwer' },
  { title: 'Superschwer' }
  
  ])
  
=end