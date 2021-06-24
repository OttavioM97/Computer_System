SELECT SpecieAccolta, count(SpecieAccolta) as Disponibili 
FROM progettogruppo2.rifugio 
WHERE NumeroBox not in(
SELECT pr.NumeroBox
FROM progettogruppo2.prenotazionerifugio as pr left join progettogruppo2.rifugio as ri
on pr.NumeroBox=ri.NumeroBox
WHERE '2020/06/09' between pr.CheckIn AND pr.CheckOut OR '2020/06/20' between pr.CheckIn AND pr.CheckOut
or (pr.CheckIn between '2020/06/09' and '2020/06/20' AND pr.CheckOut between '2020/06/09' and '2020/06/20' ))
group by SpecieAccolta;