### LEISTUNGSKLASSEN ###

performance_classes = PerformanceClass.create!([
  lk_c = { title: 'Leistungsklasse C', age_min: 10, age_max: 37, win_min: 0, win_max: 6 }, 
  lk_b = { title: 'Leistungsklasse B', age_min: 10, age_max: 37, win_min: 7, win_max: 14 }, 
  lk_a = { title: 'Leistungsklasse A', age_min: 10, age_max: 37, win_min: 15, win_max: 1000 },
  elite = { title: 'Elite', age_min: 18, age_max: 37, win_min: 26, win_max: 1000 }
])
