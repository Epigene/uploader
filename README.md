# README

## Uzdevums
Izstrādāt web aplikāciju, kur lietotājs var pievienot (upload) dokumentus.  
Lietotājam ir pieejami šādi skati/funkcionalitātes:

1. Autorizācija,
2. Saraksts ar pievienotajiem dokumentiem,
3. Dokumentu pievienošanas skats,
4. Dokumenta lejupielādes skats,
5. Dokumentu dzēšana,
6. Pdf atskaite par ielādētajiem dokumentiem laika nogrieznī.

Skati un funkcionalitātes ir definētas pietiekoši abstrakti, lai ir vieta improvizācijai, droši var izstrādāt pēc savas gaumes un ieskatiem.  
Ja ir nepieciešami kādi papildus skati/funkcionalitātes, droši var tādus izstrādāt.

## Funkcionalitāte

[Izstrādes dokuments](https://goo.gl/R7qnmZ)

## Izstrādes vides uzstādīšana
1. Apskatiet `Gemfile`, uzstādiet vajadzīgo Ruby versiju un veiciet `bundle`.  
2. Parūpējieties, ka vidē darbojas PostgreSQL versija `~> 9.5.0`.  
3. Izveidojiet `config/database.yml` failu izmantojot `config/database_example.yml` un uzstādiet datubāzi ar `rails db:create db:migrate db:seed`
4. Palaidiet `rails s` un apmeklējiet `localhost:3000`

## Piegāde produkcijā (Dokku)
https://uploader.dokku.testify.host

1. Pievienojiet Dokku remote

  ```
  $ git remote add production dokku@<IP>:uploader  
  ```

2. Veiciet `git push production master:master`
