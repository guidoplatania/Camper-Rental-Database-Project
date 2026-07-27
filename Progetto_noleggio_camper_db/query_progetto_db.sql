-- Mostrare nome, cognome, marchio, modello, date e costo totale del noleggio ordinati in modo crescente
SELECT cliente.nome, cliente.cognome, camper.marchio, camper.modello, noleggio.data_inizio, noleggio.data_fine, noleggio.costo_totale
FROM cliente JOIN noleggio ON cliente.id_cliente = noleggio.id_cliente 
JOIN camper ON camper.id_camper = noleggio.id_camper
ORDER BY costo_totale ASC;

-- Mostrare tipo, descrizione, costo, modello e marchio dei camper in manutenzione
SELECT camper.marchio, camper.modello, manutenzione.tipo, manutenzione.descrizione, manutenzione.costo
FROM camper JOIN manutenzione ON camper.id_camper = manutenzione.id_camper
WHERE camper.stato = 'In manutenzione';

-- Mostrare il noleggio (cliente e camper) che ha avuto il costo maggiore
SELECT cliente.nome, camper.marchio, noleggio.data_inizio, noleggio.data_fine, noleggio.costo_totale
FROM cliente JOIN noleggio ON cliente.id_cliente = noleggio.id_cliente 
JOIN camper ON camper.id_camper = noleggio.id_camper
WHERE noleggio.costo_totale >= (SELECT max(costo_totale) FROM noleggio);


-- Mostrare la somma dei costi dei noleggi effettuati dal cliente "Guido"
SELECT cliente.nome, SUM(noleggio.costo_totale)
FROM cliente JOIN noleggio ON cliente.id_cliente = noleggio.id_cliente
WHERE cliente.nome = 'Guido'
GROUP BY cliente.nome;


-- Mostrare tutti i noleggi prenotati per il mese di marzo
SELECT noleggio.data_inizio, noleggio.data_fine, noleggio.costo_totale
FROM noleggio
WHERE noleggio.data_inizio > '2026-02-28' AND noleggio.data_fine < '2026-04-01';


-- Mostrare la somma dei costi dei noleggi nel mese di aprile
SELECT SUM(noleggio.costo_totale)
FROM noleggio
WHERE noleggio.data_inizio > '2026-03-31' AND noleggio.data_fine < '2026-05-01';








