uses crt,sysutils;
var
    nama,nim,norut,stambuk,fak,prodi,jalur:string;
    kom:char;
    norutInt:integer;
    //note kecil : bang saya tetap pakai nomor urut dan writeln ditulis satu satu.
begin 
clrscr;
    write('Nama: ');
    readln(nama);
    write('Nim: ');
    readln(nim);
    //stambuk identifier
    stambuk:= nim[1]+nim[2];
    writeln ('Stambuk: 20', stambuk);

    //Fakultas dan profi (if bercabang karena kode prodi bisa sama)
    fak:=nim[3]+nim[4];
    prodi:=nim[5]+nim[6];
    if (fak='01') then
    begin
        writeln('Fakultas: Kedokteran');
        if (prodi='00') then //saya tetap mau buat nested if buat prodi nya bang dengan alasan input nim nya lebih rapi :V
        begin
            writeln('Prodi: Pendidikan Dokter');
        end  //
    end  
    else if (fak='02') then
    begin
        writeln('Fakultas: Hukum');
        if (prodi='00') then
        begin
            writeln('Prodi: Ilmu Hukum');
        end  //
    end  
    else if (fak='03') then
    begin
        writeln('Fakultas: Pertanian');
        if (prodi='01') then
        begin
            writeln('Prodi: Agroteknologi');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Manajemen Sumber Daya Perairan');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Agribisnis');
        end  
        else if (prodi='05') then
        begin
            writeln('Prodi: Teknologi Pangan');
        end  
        else if (prodi='06') then
        begin
            writeln('Prodi: Peternakan');
        end  
        else if (prodi='08') then
        begin
            writeln('Prodi: Teknik Pertanian dan Biosistem');
        end  
        else if (prodi='10') then
        begin
            writeln('Prodi: Agroteknologi (PSDKU)');
        end  //
    end  
    else if (fak='04') then
    begin
        writeln('Fakultas: Teknik');
        if (prodi='01') then
        begin
            writeln('Prodi: Teknik Mesin');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Teknik Elektro');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Teknik Industri');
        end  
        else if (prodi='04') then
        begin
            writeln('Prodi: Teknik Sipil');
        end  
        else if (prodi='05') then
        begin
            writeln('Prodi: Teknik Kimia');
        end  
        else if (prodi='06') then
        Begin
            writeln('Prodi: Arsitektur');
        end  
        else if (prodi='07') then
        begin
            writeln('Prodi: Teknik Lingkungan');
        end 
        else if (prodi='31') then
        begin
            writeln('Prodi: Pendidikan Profesi Insinyur');
        end //
    end  
    else if (fak='05') then
    begin
        writeln('Fakultas: Ekonomi dan Bisnis');
        if (prodi='01') then
        begin
            writeln('Prodi: Ekonomi Pembangunan');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Manajemen');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Akuntasi');
        end  
        else if (prodi='04') then
        begin
            writeln('Prodi: Kewirausahaan');
        end  //
    end  
    else if (fak='06') then
    begin
        writeln('Fakultas: Kedokteran Gigi');
        if (prodi='00') then
        begin
            writeln('Prodi: Sarjana Kedokteran Gigi');
        end  
        else if (prodi='31') then
        begin
            writeln('Prodi: Profesi Kedokteran Gigi');
        end  //
    end  
    else if (fak='07') then
    begin
        writeln('Fakultas: Ilmu Budaya');
        if (prodi='01') then
        Begin
            writeln('Prodi: Sastra Indonesia');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Sastra Melayu');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Sastra Batak');
        end  
        else if (prodi='04') then
        begin
            writeln('Prodi: Sastra Arab');
        end  
        else if (prodi='05') then
        begin
            writeln('Prodi: Sastra Inggris');
        end  
        else if (prodi='06') then
        begin
            writeln('Prodi: Ilmu Sejarah');
        end  
        else if (prodi='07') then
        begin
            writeln('Prodi: Etnomusikologi');
        end 
        else if (prodi='08') then
        begin
            writeln('Prodi: Sastra Jepang');
        end
        else if (prodi='09') then
        begin
            writeln('Prodi: Perpustakaan dan Sains Informasi');
        end
        else if (prodi='10') then
        begin
            writeln('Prodi: Bahasa Mandarin');
        end //
    end  
    else if (fak='08') then
    begin
        writeln('Fakultas: Matematika dan Ilmu Pengetahuan Alam');
        if (prodi='01') then
        begin
            writeln('Prodi: Fisika');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Kimia');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Matematika');
        end  
        else if (prodi='05') then
        begin
            writeln('Prodi: Biologi');
        end  //
    end  
    else if (fak='09') then
    begin
        writeln('Fakultas: Ilmu Sosial dan Politik');
        if (prodi='01')then
        begin
            writeln('Prodi: Sosiologi');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Ilmu Kesejahteraan Sosial');
        end  
        else if (prodi='03') then
        begin
            writeln('Prodi: Ilmu Kesejahteraan Publik');
        end  
        else if (prodi='04') then
        begin
            writeln('Prodi: Ilmu Komunikasi');
        end  
        else if (prodi='05') then
        begin
            writeln('Prodi: Antropologi Sosial');
        End  
        else if (prodi='06') then
        begin
            writeln('Prodi: Ilmu Politik');
        end  
        else if (prodi='07') then
        begin
            writeln('Prodi: Ilmu Administrasi Bisnis');
        end //
    end  
    else if (fak='10') then
    begin
        writeln('Fakultas: Kesehatan Masyarakat');
        if (prodi='00') then
        begin
            writeln('Prodi: Kesehatan Masyarakat');
        end  
        else if (prodi='01') then
        begin
            writeln('Prodi: Gizi');
        end  //
    end  
    else if (fak='11') then
    begin
        writeln('Fakultas: Keperawatan');
        if (prodi='01') then
        begin
            writeln('Prodi: Sarjana Keperawaran');
        end  
        else if (prodi='02') then
        begin
            writeln('Prodi: Profesi Ners');
        end  //
    end  
    else if (fak='12') then
    begin
        writeln('Fakultas: Kehutanan');
        if (prodi='01') then
        begin
            writeln('Prodi: Kehutanan');
        end //
    end  
    else if (fak='13') then
    begin
        writeln('Fakultas: Psikologi');
        if prodi='01' then
        begin
            writeln('Prodi: Psikologi');
        end //
    end  
    else if (fak='14') then
    begin
        writeln('Fakultas: Ilmu Komputer dan Teknologi Informasi');
        // prodi
        if (prodi='01') then
        begin
            writeln('Prodi: Ilmu Komputer');
            //No urut 
            norut:= nim[7]+nim[8]+nim[9];
            writeln('No Urut: ', norut);
            //Kom
            norutInt:= StrToInt(norut);
            if (norutInt mod 3 = 1) then 
            begin
                kom:='A';
                writeln('Kom: ',kom);
            end
            else if (norutInt mod 3 = 2) then 
            begin
                kom:='B';
                writeln('Kom: ',kom);
            end
            else 
            begin
                kom:='C';
                writeln('Kom: ',kom);
            end;
            //jalur
            if (norutInt <= 30) then 
            begin
                jalur:='SNBP';
                writeln('Jalur: ',jalur);
            end
            else if (norutInt <= 70) then 
            begin
                jalur:='SNBT';
                writeln('Jalur: ',jalur);
            end
            else 
            begin
                jalur:='SMM';
                writeln('Jalur: ',jalur);
            end;
        end
        else if (prodi='02') then
        begin
            writeln('Prodi: Teknologi Informasi'); 
        end; //
    end
    else if (fak='15') then
    begin
        writeln('(Fakultas: Farmasi');
        if (prodi='01') then
        begin
            writeln('Prodi: Farmasi');
        end  //
    end     
end.
