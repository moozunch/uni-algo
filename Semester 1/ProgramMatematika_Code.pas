program matematika;
uses crt, math;

procedure mean_median_modus();
var 
    a,mo : array [1..100]  of integer;
    i,j,n,temp: integer;
    x,median : real;
    modus : shortint;
begin
clrscr;
    writeln('|---------------------------|');
    writeln('|PROGRAM MEAN, MEDIAN, MODUS|');
    writeln('|---------------------------|');
    write('Masukkan banyak nilai : ');
        readln(n);
    for i:=1 to n do 
    begin
        write('Nilai ke-',i,'=');
        readln(a[i]);
    end;
    //mencari mean 
    x := 0;
    for i:=1 to n do 
    begin
        x:=x+a[i];
    end;
    writeln('Mean : ',x/n:4:2);
    //mencari median
     temp:=0;
    begin
        for i:=1 to n-1 do 
        begin
            for j:=n downto i do 
            if (a[j]<a[i]) then 
            begin
                temp:=a[i];
                a[i] := a[j];
                a[j] := temp;
            end;
        end;
        if (n mod 2 = 0) then 
        median := (a[n div 2]+a[(n div 2)+1])/2
        else 
        median := a[(n div 2)+1];
        writeln('Median : ',median:4:2);
    end;
    //mencari modus 
   for i:=1 to n do 
   begin
    mo[i] := 0;
    for j:=i+1 to n do 
    begin
        if a[i] = a[j] then 
        mo[i] := mo[i] + 1;
    end;
   end;

   for i:=1 to n do 
   begin
    if mo[i]>0 then 
    modus:=i;
   end;
   writeln('Modus adalah : ',a[modus]);
   end; 

procedure elmns;
const
Maksimal = 10;

type
    Matriks = array[1..Maksimal, 1..Maksimal + 1] of Real;

var
    A: Matriks;
    N, i: Integer;

procedure TukarBarisNol(var A: Matriks; i, j: Integer);
    var
        k: Integer;
        sub: Real;
    begin
        for k := 1 to N + 1 do
        begin
            sub := A[i, k];
            A[i, k] := A[j, k];
            A[j, k] := sub;
        end;
    end;

procedure ProsesEliminasi(var A: Matriks);
    var
        i, j, k: Integer;
        pivot : shortint;
        c: real;

    begin
        for i := 1 to N do
            begin              
                pivot := i;
                for j := i + 1 to N do
                    begin
                        if Abs(A[j, i]) > Abs(A[pivot, i]) then
                            pivot := j;
                        end;

                        if pivot <> i then
                            TukarBarisNol(A, i, pivot);

                            c := A[i, i];
                        for j := 1 to N + 1 do
                            A[i, j] := A[i, j] / c;

                        for j := 1 to N do
                            begin
                            if (i <> j) and (A[j, i] <> 0) then
                                begin
                                    c := A[j, i];
                                    for k := 1 to N + 1 do
                                    A[j, k] := A[j, k] - c * A[i, k];
                                end;
                            end;
            end;
    end;

procedure PrintMatriks(var A: Matriks);
    var
        i, j: Integer;
            begin
                for i := 1 to N do
                    begin
                        for j := 1 to N + 1 do
                        Write(A[i, j]:8:4, ' ');
                        Writeln;
        end;
    end;

procedure InputMatriks;
    var
        i, j: Integer;

    begin
    writeln('|------------------------------------|');
    writeln('| PROGRAM ELIMINASI PERSAMAAN LINEAR |');
    writeln('| DENGAN METODE GAUSS JORDAN         |');
    writeln('|------------------------------------|');
        repeat
            Write('Masukkan jumlah variabel yang digunakan (N, 1 <= N <= ', Maksimal, '): ');
            Readln(N);
        until (N >= 1) and (N <= Maksimal);
        Writeln('Matriks : ');
        for i := 1 to N do
            begin
                writeln('BARIS ', i, ' ');
                writeln();
                    for j := 1 to N + 1 do
                        begin
                            writeln('kolom ', j );
                            Read(A[i, j]);
                        end;
                writeln();
            end;
    end;

begin
    clrscr;
    InputMatriks;
    clrscr;
    Writeln('Bentuk Matriks:');
    PrintMatriks(A);
    ProsesEliminasi(A);
    Writeln;
    Writeln('Matriks Hasil:');
    PrintMatriks(A);
    Writeln;
    Writeln('Hasil Akhir:');
    for i := 1 to N do
        Writeln('x', i, ' = ', A[i, N + 1]:8:4);
        end;

        procedure bdr();
        var
    operasi:real;
    x,y:string;
    apa:string;

procedure garis;
begin
    writeln ('--------------------------------');
end;

procedure pertanyaan;
begin
    clrscr;
    write('Apa yang ingin dikerjakan (luas/keliling): ');
    readln(apa);
end;

procedure pertanyaanvolume;
begin
    clrscr;
    write('Apa yang ingin dikerjakan (Volume/Luas permukaan): ');
    readln(apa);
end;

function DLPersegi:integer; //alasan pakai function biar bisa nilai dibalikkan
var s:integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan panjang sisi persegi: ');
    readln (s);
    if apa='luas' then begin
        DLPersegi := s*s;    
    end else begin
        DLPersegi := 4*s;    //keliling
    end;
end;

function DLPersegi_panjang:real;
var p,l: integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan panjang persegi panjang: ');
    readln (p);
    write ('Masukkan lebar persegi panjang');
    readln (l);
    if apa='luas' then begin
        DLPersegi_panjang := p*l;
    end else begin
        DLPersegi_panjang := 2*(p+l); //keliling
    end;
end;

function DLSegitiga:real; //real, inside integer
var a,t,c: integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan panjang alas segitiga: ');
    readln (a);
    write ('Masukkan tinggi segitiga');
    readln (t);
    if apa ='luas' then begin
        DLSegitiga := (a*t)/2; 
    end else begin
        write('Masukkan sisi ketiga segitiga: ');
        readln(c);
        DLSegitiga := (a+t+c); //keliling
    end;
end;

function DLTrapesium:real; //real, inside integer
var a,t,b,c: integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan sisi trapesium sejajar [1]: ');
    readln (a);
    write ('Masukkan sisi trapesium sejajar [2]: ');
    readln (b);
    write ('Masukkan tinggi trapesium');
    readln (t);
    if apa ='luas' then begin
        DLTrapesium := 0.5 * (a+b)*t;
    end else begin
        write('Masukkan sisi ke-4 trapesium: ');
        readln(c);
        DLTrapesium := (a+b+t+c); //keliling
    end;
end;

function DLLingkaran:real; //real, inside integer
var r: integer;
const pi=3.14;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan jari-jari Lingkaran: ');
    readln (r);
    if apa ='luas' then begin
        DLLingkaran := pi * r * r;
    end else begin
        DLLingkaran := 2*pi*r; //keliling
    end;
end;

function DLJajar_genjang:real; //real, inside integer
var a,t: integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan alas Jajar Genjang: ');
    readln (a);
    write ('Masukkan tinggi Jajar Genjang: ');
    readln (t);
    if apa ='luas' then begin
        DLJajar_genjang := a * t;
    end else begin
        DLJajar_genjang := 2*(a+t); //keliling
    end;
end;

function DLKetupat:real; //real, inside integer
var d1,d2: integer;
begin
    pertanyaan;
    clrscr;
    if apa ='luas' then begin
        write ('Masukkan diagonal Belah Ketupat [1]: ');
        readln (d1);
        write ('Masukkan diagonal Belah Ketupat [2]: ');
        readln (d2);
        DLKetupat := 0.5 * (d1 * d2);
    end else begin
        write ('Masukkan panjang sisi Belah Ketupat: ');
        readln (d1);
        DLKetupat := 4 * d1; //keliling
    end;
end;

function DLLayang:real; //real, inside integer
var d1,d2: integer;
begin
    pertanyaan;
    clrscr;
    write ('Masukkan diagonal Belah Ketupat [1]: ');
    readln (d1);
    write ('Masukkan diagonal Belah Ketupat [2]: ');
    readln (d2);
    if apa ='luas' then begin
        DLLayang := 0.5 * (d1 * d2);
    end else begin
        DLLayang := 2 * (d1+d2); //keliling
    end;
end;

// bangun ruang
function DVKubus:real; //real, inside integer
var s: integer;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan panjang sisi Kubus: ');
    readln (s);
    if apa ='volume' then begin
        DVKubus := s * s * s;
    end else begin
        DVKubus := 6 * (s*s); // luas permukaan
    end;
end;

function DVBalok:real; //real, inside integer
var p,l,t: integer;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan panjang Balok: ');
    readln (p);
    write ('Masukkan lebar Balok: ');
    readln (l);
    write ('Masukkan tinggi Balok: ');
    readln (t);
    if apa ='volume' then begin
        DVBalok := p * l * t;
    end else begin
        DVBalok := 2 * ((p * l) + (l * t) + (p * t)); // luas permukaan
    end;
end;

function DVPrisma:real; //real, inside integer
var p,l,t: integer;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan panjang Prisma: ');
    readln (p);
    write ('Masukkan lebar Prisma: ');
    readln (l);
    write ('Masukkan tinggi Prisma: ');
    readln (t);
    if apa ='volume' then begin
        DVPrisma := 0.5 * (p * l * t);
    end else begin
        DVPrisma := 2 * ((p*l)+(l*t)); // luas permukaan
    end;
end;

function DVTabung:real; //real, inside integer
var r,t: integer;
const pi = 3.14;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan jari-jari Tabung: ');
    readln (r);
    write ('Masukkan tinggi Tabung: ');
    readln (t);
    if apa ='volume' then begin
        DVTabung := pi * r * t;
    end else begin
        DVTabung := 2 * pi * r * (r + t); // luas permukaan
    end;
end;

function DVLimas:real; //real, inside integer
var l,t,n,i: integer;
    l2 : array [1..6] of integer;
begin
    pertanyaanvolume;
    clrscr;
    DVLimas := 0;
    if apa ='volume' then begin
        write ('Masukkan Luas alas Limas: ');
        readln (l);
        write ('Masukkan tinggi Limas: ');
        readln (t);
        DVLimas := 1/3 * (l * t);
    end else begin
        write ('Limas sisi berapa? ');
        readln(n);
        for i := 1 to n do
        begin
            write ('Masukkan luas sisi ke-',i,'limas: ');
            readln (l2[i]);
            DVLimas += l2[i]; // luas permukaan 
        end;
    end;
end;

function DVKerucut:real; //real, inside integer
var r,t: integer;
    s:real;
const pi = 3.14;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan jari-jari Kerucut: ');
    readln (r);
    write ('Masukkan tinggi Kerucut: ');
    readln (t);
    if apa ='volume' then begin
        DVKerucut := 1/3 * (pi * r * r) * t;
    end else begin
        s := (sqrt ((r*r) + (t * t)));
        DVKerucut := (pi * r * s) + (pi * r * r); // luas permukaan
    end;
end;

function DVBola:real; //real, inside integer
var r: integer;
const pi = 3.14;
begin
    pertanyaanvolume;
    clrscr;
    write ('Masukkan jari-jari Bola: ');
    readln (r);
    if apa ='volume' then begin
        DVBola := 4/3 * (pi * r * r * r );
    end else begin
        DVBola := 4 * pi * r * r // luas permukaan
    end;
end;


begin 
    clrscr;
    writeln('|------------------------------------|');
    writeln('|   BANGUN DATAR DAN BANGUN RUANG    |');
    writeln('|------------------------------------|');
    writeln('|No.|          PILIHAN               |');
    writeln('|------------------------------------|');
    writeln('| 1 | Bangun Ruang                   |');
    writeln('| 2 | Bangun Datar                   |');
    writeln('|------------------------------------|');
    write('masukkan nomor: '); readln(y);
    clrscr;
    if y = '2' then begin // bangun datar
        garis;
        writeln('2.1 Persegi');
        writeln('2.2 Persegi Panjang');
        writeln('2.3 Segitiga');
        writeln('2.4 Trapesium');
        writeln('2.5 Lingkaran');
        writeln('2.6 Jajar Genjang');
        writeln('2.7 Ketupat');
        writeln('2.8 Layang-layang');
        garis;
        write('Masukkan no yang ingin dikerjakan: ');
        readln(x);
        case x of
            '2.1' : operasi := DLPersegi;
            '2.2' : operasi := DLPersegi_panjang;
            '2.3' : operasi := DLSegitiga;
            '2.4' : operasi := DLTrapesium;
            '2.5' : operasi := DLLingkaran;
            '2.6' : operasi := DLJajar_genjang;
            '2.7' : operasi := DLKetupat;
            '2.8' : operasi := DLLayang;
        else write ('Error: operation not in order');
        end;
    end else if y = '1' then begin //bangun ruang
        garis;
        writeln('1.1 Kubus');
        writeln('1.2 Balok');
        writeln('1.3 Prisma');
        writeln('1.4 Tabung');
        writeln('1.5 Limas');
        writeln('1.6 Kerucut');
        writeln('1.7 Bola');
        garis;
        write('Masukkan no yang ingin dikerjakan: ');
        readln(x);
        case x of
            '1.1' : operasi := DVKubus;
            '1.2' : operasi := DVBalok;
            '1.3' : operasi := DVPrisma;
            '1.4' : operasi := DVTabung;
            '1.5' : operasi := DVLimas;
            '1.6' : operasi := DVKerucut;
            '1.7' : operasi := DVBola;
        else
        write ('Error: operation not in order');
        end;
    write (operasi:2:2);
    end;
end;

procedure pk();
function Factorial(n: Integer): Integer;
var
  i, result: Integer;
begin
  result := 1;
  for i := 1 to n do
    result := result * i;
  Factorial := result;
end;

function Permutation(n, r: Integer): Integer;
begin
  Permutation := Factorial(n) div Factorial(n - r);
end;

function Combination(n, r: Integer): Integer;
begin
  Combination := Factorial(n) div (Factorial(r) * Factorial(n - r));
end;

var
  choice, n, r, result: Integer;

begin
  writeln('Program Permutation dan Kombinasi');
  writeln('1. Permutation');
  writeln('2. Kombinasi');
  write('Enter your choice (1 or 2): ');
  readln(choice);

  write('Enter the value of n: ');
  readln(n);

  write('Enter the value of r: ');
  readln(r);

  case choice of
    1:
    begin
      result := Permutation(n, r);
      writeln('Permutation of ', n, 'P', r, ' = ', result);
    end;
    2:
    begin
      result := Combination(n, r);
      writeln('Combination of ', n, 'C', r, ' = ', result);
    end;
    else
      writeln('Invalid choice. Please enter 1 or 2.');
  end;

  readln;
end;

function operasi_hitung():real;
label error;
var
    bil: array[1..100] of real;
    total,pangkat:real;
    i:integer;
    operasi:string;

begin
    clrscr;
    i:=1;
    total:=0;
    writeln('===========================================');
    writeln('||             OPERASI HITUNG            ||');
    writeln('===========================================');
    writeln('||   SIMBOL   |          OPERASI         ||');
    writeln('-------------------------------------------');
    writeln('||     +      |        PENJUMLAHAN       ||');
    writeln('||     -      |        PENGURANGAN       ||');
    writeln('||     *      |        PERKALIAN         ||');
    writeln('||     /      |        PEMBAGIAN         ||');
    writeln('||     ^      |        PERPANGAKATAN     ||');
    writeln('||     =      |        HASIL TOTAL       ||');
    writeln('===========================================');

    repeat
        error:
        begin
        write('Masukkan pengoperasian  yang ingin dilakukan : ');
        readln(operasi);
            case (operasi) of
                '+' :   begin
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            if (i>=2) then begin total:= total + bil[i]; end
                            else if (i<2) then begin
                            i:= i+1;
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            total:= total + bil[i-1] + bil[i]; end;
                        end;
                '-' :   begin
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            if (i>=2) then begin total:= total - bil[i]; end
                            else if (i<2) then begin
                            i:= i+1;
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            total:= total + bil[i-1] - bil[i]; end;
                        end;
                '*' :   begin
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            if (i>=2) then begin total:= total * bil[i]; end
                            else if (i<2) then begin
                            i:= i+1;
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            total:= total + bil[i-1] * bil[i]; end;
                        end;
                '/' :   begin
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            if (i>=2) then begin total:= total / bil[i]; end
                            else if (i<2) then begin
                            i:= i+1;
                            write('Masukkan bilangan ke-',i,' : ');
                            readln(bil[i]);
                            total:= total + bil[i-1] / bil[i]; end;
                        end;
                '^' :   begin
                            if (i=1) then 
                            begin
                                write('Masukkan bilangan ke-',i,' : '); 
                                readln(bil[i]);
                                write('Masukkan pangkat : ');
                                readln(pangkat);
                                if (pangkat=1) then begin total:= bil[i]; end else
                                begin total:= power(bil[i],pangkat); end;
                            end else
                            begin
                                bil[i]:= total;
                                write('Masukkan pangkat : ');
                                readln(pangkat);
                                if (pangkat=1) then begin total:= bil[i]; end else
                                begin total:= power(bil[i],pangkat); end;
                            end;
                        end;
                '=' :   
                            else 
                                writeln('-------------------------------------------');
                                writeln('Error, silahkan masukkan kembali'); 
                                writeln('-------------------------------------------');
                                goto error;
                    end;
            i:= i+1;
        end;
    until (operasi = '=');

    writeln('===========================================');
    writeln('Total = ',total:2:2);
    writeln('===========================================');
end;


function syarat_logaritma(log:real;i:integer):real;
label error;
var
    basis,numerus:real;

begin
    writeln('Persamaan logartima ke-',i);
    writeln('-------------------------------------------');
    error:
        write('Masukkan bilangan basis : ');
        readln(basis);
            if (basis<0) or (basis=1) then begin 
                                            writeln('-------------------------------------------');
                                            writeln('Error, silahkan masukkan ulang');
                                            writeln('-------------------------------------------');
            goto error; end;
            write('Masukkan bilangan dari numerus : ');
            readln(numerus);
                        
        if (numerus= 1) then log:=0;
        if (numerus= 0) then log:=1;
        if (basis=numerus) then log:=1;

        log:= Logn(basis,numerus);
        syarat_logaritma:= log;
        writeln('-------------------------------------------');
end;


function logaritma():real;
label error,v;
var
    basis,numerus,total,x:real;
    log: array[1..100] of real;
    i,pangkat:integer;
    operasi:string;

begin
    clrscr;
    total:=0;
    i:=1;
    writeln('||               Logaritma               ||');
    writeln('===========================================');
    repeat
        begin
            if(i=1) then begin
            total:=syarat_logaritma(log[i],i);
            i:=i+1; end;
            error:
            writeln('===========================================');
            writeln('||   SIMBOL   |          OPERASI         ||');
            writeln('-------------------------------------------');
            writeln('||     +      |        PENJUMLAHAN       ||');
            writeln('||     -      |        PENGURANGAN       ||');
            writeln('||     *      |        PERKALIAN         ||');
            writeln('||     /      |        PEMBAGIAN         ||');
            writeln('||     ^      |        PERPANGAKATAN     ||');
            writeln('||     =      |        HASIL TOTAL       ||');
            writeln('===========================================');
            write('Masukkan pengoperasian  yang ingin dilakukan : ');
            readln(operasi);
                case (operasi) of
                    '+' : begin
                                x:= syarat_logaritma(log[i],i);
                                total:= total + x;
                            end;
                    '-' : begin
                                x:= syarat_logaritma(log[i],i);
                                total:= total - x;
                            end;
                    '*' :   begin
                                x:= syarat_logaritma(log[i],i);
                                total:= total * x;
                            end;
                    '/' :  begin
                                x:= syarat_logaritma(log[i],i);
                                total:= total / x;
                            end;
                    '^' :   begin
                                write('Masukkan pangkat : ');
                                readln(pangkat);
                                total:= power(x,pangkat);
                                goto v;
                            end;
                    '=' :   begin if (i=1) then begin total:= x; end; end;
                                else 
                                    writeln('-------------------------------------------');
                                    writeln('Error, silahkan masukkan kembali'); 
                                    writeln('-------------------------------------------');
                                    goto error;
                            end;
                        i:= i+1;
                end;
            until ( operasi = '=');
            V:
            writeln('===========================================');
            writeln('Total : ',total:0:2); 
            writeln('===========================================');
end;



label error;
var code: string;

//PROGRAM UTAMA 
begin
    clrscr; 
    error:
    writeln('|--------------------------------------------|');
    writeln('|        KUMPULAN MATERI MATEMATIKA          |');
    writeln('|--------------------------------------------|');
    writeln('|Kode |    MATERI MATEMATIKA                 |');
    writeln('|--------------------------------------------|');
    writeln('|  1  | Operasi Hitung Sederhana             |');
    writeln('|  2  | Logaritma                            |');
    writeln('|  3  | Bangun Datar & Bangun Ruang          |');
    writeln('|  4  | Mean, Median, dan Modus              |');
    writeln('|  5  | Eliminasi Persamaan Linear           |');
    writeln('|     | dengan Metode Gauss Jordan           |');
    writeln('|  6  | Permutasi & Kombinasi                |');
    writeln('|--------------------------------------------|');
    write('Masukkan pilihan dengan kode: ');
        readln(code);
    if (code = '1') then 
    begin
    logaritma; 
    end else
    if (code = '2') then 
    begin
        bdr;
    end else 
    if (code = '3') then 
    begin
        mean_median_modus;
    end else
    if (code = '4') then 
    begin
        elmns;
    end else 
    if (code = '5') then 
    begin
        pk;
    end else
    if(code = '6') then
    begin
        operasi_hitung;
    end else
    begin  clrscr; 
            writeln('-------------------------------------------');
            writeln('Error, silahkan masukkan kode yang tersedia');
            writeln('-------------------------------------------');
            goto error; end
    end.
