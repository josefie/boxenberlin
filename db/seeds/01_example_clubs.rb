@clubs = Club.create!([
  
  # Beispielvereine
  { name: 'Berliner Boxverband', contact_mail: 'bbv@web.de', password: 'pw1', password_confirmation: 'pw1' },
  { name: 'SV Blau-Gelb', contact_mail: 'a.freiwald@web.de', password: 'pw2', password_confirmation: 'pw2' }, 
  { name: 'Spandauer BC 26', contact_mail: 'box_info.bbv@t-online.de', password: 'pw3', password_confirmation: 'pw3' }, 
  { name: 'Boxring Hertha BSC', contact_mail: 'info@herthabsc.de', password: 'pw4', password_confirmation: 'pw4' }, 
  { name: 'SV Astoria', contact_mail: 'Senol.Ercel@gmx.de', password: 'pw5', password_confirmation: 'pw5' }
  
  ])
