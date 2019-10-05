i file con denominazione "ord" stanno ad indicare quelli che sono stati ordinati con il codice matlab
in base a come la FC vuole i dati. (L'ordinamento è stato fatto con i dati in decimale, poi convertiti in bin) 

Nel caso 4x4:

PRIMO LAYER FC

1e 16 Uscite: leggo i primi 16 pesi, 
              ne salto 84-16= 68
              leggo altri 16 pesi
              Così via fino alla fine del file...

2e 16 Uscite: salto i primi 16 pesi,
              leggo i 16 pesi successivi, 
              ne salto 84-16= 68
              leggo altri 16 pesi
              Così via fino alla fine del file...

3e 16 Uscite: salto i primi 32 pesi,
              leggo i 16 pesi successivi, 
              ne salto 84-16= 68
              leggo altri 16 pesi
              Così via fino alla fine del file...

4e 16 Uscite: salto i primi 48 pesi,
              leggo i 16 pesi successivi, 
              ne salto 84-16= 68
              leggo altri 16 pesi
              Così via fino alla fine del file...

5e 16 Uscite: salto i primi 64 pesi,
              leggo i 16 pesi successivi, 
              ne salto 84-16= 68
              leggo altri 16 pesi
              Così via fino alla fine del file...

Ultime 4 Uscite: salto i primi 80 pesi,
                 leggo i 4 pesi successivi, 
                 ne salto 84-4= 80
                 leggo altri 4 pesi
                 Così via fino alla fine del file...


SECONDO LAYER FC: 

1e 8 uscite: Leggo i primi 8 pesi,
             ne salto 10-8 = 2
             leggo altri 8 pesi 
             Così via fino alla fine del file...

Ultime 2 uscite: salto i primi 8 pesi,
                 leggo i 2 pesi successivi,  
                 ne salto 10-2 = 8
                 leggo altri 2 pesi 
                 Così via fino alla fine del file...
             
