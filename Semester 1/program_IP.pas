uses crt, SysUtils;

type 
    mahasiswa = record
        nama : string;
        nim : string[10];
        hnilai : string[2];
        tnilai : real;
        ip : real;
    end;

    matkul = record
        namkul : string;
        sks : byte;
    end;

var
    f: textfile;
    filename: string; 
    i, j, banyak_matkul: integer; 
    var_mahasiswa : mahasiswa;
    var_matkul: array [1..20] of matkul;
    total_sks: integer;
    nilai_matkul: array [1..20] of string; // array untuk masukkan nilai tiap matkul

procedure garis_display;
begin
    writeln(f, '=================');
end;

procedure garis;
begin
    writeln('=================');
end;

procedure garis2_display;
begin
    writeln(f, '|=================================================|');
end;

function konversi(hnilai: string): real;
begin
    case hnilai of
        'A': konversi := 4.0;
        'B+': konversi := 3.5;
        'B': konversi := 3.0;
        'C+': konversi := 2.5;
        'C': konversi := 2.0;
        'D': konversi := 1.0;
        'E': konversi := 0.0;
    else
        begin
            writeln('Error: nilai tidak valid');
            konversi := 0.0;
        end;
    end;
end;

begin
    clrscr;
    
    //mulai project
    //inputan
    write('Banyak Matkul: ');
    readln(banyak_matkul);
    for i := 1 to banyak_matkul do 
    begin
        clrscr;
        with var_matkul[i] do 
        begin
            writeln('Matkul [', i, ']');
            garis;
            writeln;
            write('Nama Matkul: ');
            readln(namkul);
            write('SKS        : ');
            readln(sks);
            total_sks := total_sks + sks; // Update total_sks
        end;
    end;
     
    with var_mahasiswa do 
    begin
        clrscr;
        writeln('Mahasiswa');
        garis;
        writeln;
        write('Nama: ');
        readln(nama);
        write('NIM : ');
        readln(nim);
        filename := 'KHS_' + nim + '_' + nama + '.txt'; //pembuatan file
        Assign(f, filename);
    end;
    
    var_mahasiswa.tnilai := 0; // total nilai

    for j := 1 to banyak_matkul do
    begin
        write('Nilai ', var_matkul[j].namkul, ': ');
        readln(nilai_matkul[j]); // Input nilai satu per satu
        nilai_matkul[j] := upcase(nilai_matkul[j]); //upper case
        var_mahasiswa.tnilai := var_mahasiswa.tnilai + (konversi(nilai_matkul[j]) * var_matkul[j].sks);
    end;  

    var_mahasiswa.ip := var_mahasiswa.tnilai / total_sks;

    // tampilan di txt file
    rewrite(f);
    writeln(f, 'Kartu Hasil Studi');
    garis_display;
    writeln;
    with var_mahasiswa do 
    begin
        writeln(f, 'Nama      : ', nama);
        writeln(f, 'NIM       : ', nim);
    end;
    writeln(f);
    garis2_display;
    writeln(f,'|No   | Matkul                              |Nilai|');
    garis2_display;
    for i := 1 to banyak_matkul do
    begin
        with var_matkul[i] do 
        begin
            write(f, '|', i,'.');
            for j := 1 to (4 - Length(IntToStr(i))) do begin// length menghitung string
                write(f, ' ');
            end;
            write(f, '| ', namkul);
            for j := 1 to (36 - Length(namkul)) do begin //length paling membantu untuk array
                write(f, ' '); 
            end;
            write(f, '|', nilai_matkul[i]);
            for j := 1 to (5 - Length(nilai_matkul[i])) do begin
                write(f, ' ');
            end;
            writeln(f, '|');
        end;
    end;
    garis2_display;
    writeln(f);
    writeln(f, 'Total SKS  : ', total_sks);
    writeln(f, 'IP Semester: ', var_mahasiswa.ip:0:2);
    close(f);
    // end di terminal
    clrscr;
    writeln('File telah dibuat!');
end.
