@clubs = Club.create!([
  
  # Beispielvereine
  { name: 'Berliner Boxverband', contact_mail: 'boxen@bbv.de', password: 'pw1', password_confirmation: 'pw1' }, #Admin
  { name: 'SV Blau-Gelb', contact_mail: 'boxen@svblaugelb.de', password: 'pw2', password_confirmation: 'pw2' }, 
  { name: 'Spandauer BC 26', contact_mail: 'boxen@spandauerbc.de', password: 'pw3', password_confirmation: 'pw3' }, 
  { name: 'Boxring Hertha BSC', contact_mail: 'boxen@herthabsc.de', password: 'pw4', password_confirmation: 'pw4' }, 
  { name: 'SV Astoria', contact_mail: 'boxen@svastoria.de', password: 'pw5', password_confirmation: 'pw5' }
  
  ])
