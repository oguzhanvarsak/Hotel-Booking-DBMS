SELECT otel_adi, otel_gunluk_ucret FROM Otel
WHERE otel_gunluk_ucret < 200;

SELECT otel_adi, otel_yildiz FROM Otel
WHERE otel_yildiz >= 3;

SELECT otel_adi, otel_adres FROM Otel
WHERE otel_adres = 'Belek';

SELECT Otel.otel_adi, Oda.otel_id FROM ODA
INNER JOIN Otel ON Oda.otel_id = Otel.otel_id
WHERE oda_tipi = 'Kral Suit';

SELECT Otel.otel_adi, 
Calisanlar.calisan_adi +’ ‘+ Calisanlar.calisan_soyadi AS Calisan, 
Yoneticiler.yonetici_adi +’ ‘+ Yoneticiler.yonetici_soyadi AS Yonetici 
FROM Calisanlar 
INNER JOIN Yoneticiler ON Calisanlar.yonetici_id = Yoneticiler.yonetici_id 
INNER JOIN Otel ON Calisanlar.otel_id = Otel.otel_id 
WHERE Calisanlar.otel_id = 4;

SELECT Calisanlar.calisan_adi +’ ‘+ Calisanlar.calisan_soyadi AS Calisan, oda_id 
FROM Calisanlar 
WHERE otel_id = 4;

SELECT Konuk.isim +' '+ Konuk.soyisim AS Konuk, 
Konuk.eposta, Konuk.telefon 
FROM Rezervasyon 
INNER JOIN Otel ON Rezervasyon.otel_id = Otel.otel_id 
INNER JOIN Konuk ON Rezervasyon.konuk_id = Konuk.konuk_id 
WHERE Rezervasyon.otel_id = 4;

SELECT oda_id, 
	CASE 
		WHEN oda_durumu = 1 THEN 'Dolu' 
		WHEN oda_durumu = 0 THEN 'Boş' 
	END AS 'Oda Durumu' 
From Oda 
WHERE otel_id = 4;