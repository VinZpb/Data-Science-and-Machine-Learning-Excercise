## CODING CHALLENGE

## Buatlah sebuah function dengan parameter yang dapat menerima argumen berupa string (1 kata saja).
## Syarat --> Function dapat mencetak argumen ke dalam beberapa baris, dan di tiap barisnya ada penambahan 1 karakter.

## Bentuk output-nya akan menjadi seperti segitiga siku-siku yang sudut sikunya ada di sebelah kiri bawah.
## Jika string yang dimasukkan ke dalam argumen tidak bisa memenuhi syarat di atas, maka akan muncul informasi
    ## bahwa panjang kata tidak mencukupi untuk dijadikan seperti output yang diminta. 

## Contoh output:

## kata('Purwadhika')

# P
# ur
# wad
# hika

#================================================================================================================================#
# Vincent / JCDS
#================================================================================================================================#


def menu():
    kata=input("Masukkan kata yang diinginkan (Kriteria: alphabet a-z , tanpa spasi dan simbol): ")
    lk=[0]
    n=1
    while lk[-1]<len(kata):
        lk.append(n*(n+1)/2)
        n+=1
    if kata.isalpha() and len(kata) in lk:
        for i in range(len(lk)-1):
            print(kata[int(lk[i]):int(lk[i+1])])
    elif len(kata) not in lk:
        print("Panjang kata tidak mencukupi untuk dijadikan seperti output yang diminta")
        menu()
    else:
        print("Kata tidak memenuhi kriteria")
        menu()

menu()