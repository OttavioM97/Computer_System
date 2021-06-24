SELECT tab1.Descrizione, (Entrate-ifnull(Uscite,0)) AS Giacenze
FROM 
(SELECT Descrizione, sum(Quantita) AS Entrate
FROM progettogruppo2.materialediconsumo as m inner join progettogruppo2.composizione as c 
on m.CodiceABarre=c.CodiceABarre
GROUP BY c.CodiceABarre) as tab1 LEFT JOIN 
(SELECT Descrizione, sum(QuantitaUscita) AS Uscite
FROM progettogruppo2.materialediconsumo as m inner join progettogruppo2.uscitamateriale as u 
on m.CodiceABarre=u.CodiceMateriale
GROUP BY u.CodiceMateriale) as tab2 on tab1.Descrizione=tab2.Descrizione;