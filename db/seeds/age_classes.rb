# ruby encoding: utf-8

### ALTERSKLASSEN ###

age_classes_1 = PerformanceClass.create!([
  # Schüler und Kadetten
  { title: 'Schüler', age_min: 10, age_max: 12, gender: false },
  { title: 'Kadetten (U15)', age_min: 13, age_max: 14, gender: false }
  ])

age_classes_2 = PerformanceClass.create!([
  # Junioren
  { title: 'Junioren (U17)', age_min: 15, age_max: 16, gender: false }
  ])
  
age_classes_3 = PerformanceClass.create!([
  # männliche Jugend und Männer
  { title: 'männliche Jugend (U19)', age_min: 17, age_max: 18, gender: false }, 
  { title: 'Männer', age_min: 19, age_max: 37, gender: false }
  ])
  
age_classes_4 = PerformanceClass.create!([
  # Schülerinnen und Kadettinnen
  { title: 'Schülerinnen', age_min: 10, age_max: 12, gender: true }, 
  { title: 'Kadettinnen (U15)', age_min: 13, age_max: 14, gender: true }, 
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
  