Úlohy
=====

Řešení úloh zadaných v dokumentu:
<http://monoceros.physics.muni.cz/~zbona/unix/zadani_unix.pdf>.

## A1
```
echo ~/.??*
```

## A2
S názvy souborů:
```
tail -n 1 /usr/include/*.h
```
Bez názvů souborů:
```
tail -qn 1 /usr/include/*.h
```

## A3
Triviální řešení, které vypisuje upozornění, narazí-li na adresář vyhovující
uvedenému výrazu:
```
cp /usr/include/[!0-9]*[0-9]* ~
```
Čistší řešení, které ignoruje adresáře:
```
find /usr/include -maxdepth 1 -type f -regex '[^0-9].*[0-9].*' -exec cp '{}' ~ \;
```

## A4
Následující příkaz zjistí počet zalomení řádků (tedu počet znaků `0x0a`)
v souboru `/etc/group`. Za předpokladu, že je i poslední řádek tohoto souboru
ukončen zalomením, je výsledek shodný s počtem řádků v souboru:
```
wc -l < /etc/group
```

## A5
Nastavit čas modifikace souboru `file` na 15:04 místního časového pásma
dne 11. 3. 1993:
```
touch -m --date="1993-03-11 15:04" file
```

## A6
Druhý největší ze souborů, jejichž názvy nezačínají tečkou:
```
ls -S /usr/bin | head -n2 | tail -n1
```
Je-li žádoucí zahrnout i soubory s tečkou (což se mi v adresáři `/usr/bin`
zdá zbytečné), je nutno příkaz upravit na:
```
ls -aS /usr/bin | head -n2 | tail -n1
```

## A7
```
chmod -R g+r,o-r /tmp/adresar
```
Výše uvedený příkaz provede požadované úpravy oprávnění i pro samotný adresář
`/tmp/adresar`. Je-li to nežádoucí, je nutno příkaz upravit následovně:
```
chmod -R g+r,o-r /tmp/adresar/*
```

## A8
Symbolický zápis:
```
touch file && chmod u=rwx,g=rx,o=r file
```
Oktální zápis:
```
touch file && chmod 754 file
```