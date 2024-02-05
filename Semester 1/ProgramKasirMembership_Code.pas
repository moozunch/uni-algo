Program KasirSupermarket;
uses crt, SysUtils;

type
    MemberData = record
        Nama: string;
        NomorMember: string;
        Poin: integer;
    end;

var
    DaftarMember: array of MemberData;
    i, n, n1, x, IndexMember: integer;
    f: textfile;
    filename, yn, upyn: string;
    diskon, diskonMusiman, totalPembayaran, harga, totalakhir: real;
    barang: string;
    waktu: TDateTime;
    year, month, day: Word;
    p: ^real;

function garis: string;
begin
    garis := ('================================');
end;

procedure BelanjaSebagaiMember;
var
    NomorMember: string;
    TotalBelanja: real;
    IndexMember, i: integer;
begin
    write('Masukkan nomor member: ');
    readln(NomorMember);

    // Cari nomor member dalam data
    IndexMember := -1;
    for i := 0 to High(DaftarMember) do
    begin
        if DaftarMember[i].NomorMember = NomorMember then
        begin
            IndexMember := i;
            break;
        end;
    end;

    if IndexMember = -1 then
        writeln('Nomor member tidak ditemukan.')
    else
    begin
        writeln('Masukkan total belanja: ');
        readln(TotalBelanja);
        writeln;

        // Proses pemberian poin (contoh: 1 poin untuk setiap Rp 30.000 pembelanjaan)
        DaftarMember[IndexMember].Poin := DaftarMember[IndexMember].Poin + Trunc(TotalBelanja / 30000);

        writeln('Terima kasih telah berbelanja, ', DaftarMember[IndexMember].Nama, '!');
        writeln('Poin member saat ini: ', DaftarMember[IndexMember].Poin);
        writeln('Poin member telah ditambahkan!');
    end;
end;

procedure PendaftaranMember;
var
    NewMember: MemberData;
begin
    clrscr;
    write('Masukkan nama member: ');
    readln(NewMember.Nama);

    write('Masukkan nomor member: ');
    readln(NewMember.NomorMember);

    // Cek apakah nomor member sudah ada
    for i := 0 to High(DaftarMember) do
    begin
        if DaftarMember[i].NomorMember = NewMember.NomorMember then
        begin
            writeln('Nomor member sudah terdaftar sebelumnya.');
            exit;
        end;
    end;

    NewMember.Poin := 0;

    SetLength(DaftarMember, Length(DaftarMember) + 1);
    DaftarMember[High(DaftarMember)] := NewMember;

    //pemberian nama kartu member
    filename := 'kartu Member ' + NewMember.Nama + '.txt'; //pembuatan file
    Assign(f, filename);
    //isi kartu member
    rewrite(f);
    writeln(f, 'Kartu Member CSS Supermarket');
    writeln(f,garis);
    writeln(f);
    writeln(f, 'Nama Pemilik : ', NewMember.Nama);
    writeln(f, 'Nomor Member : ', NewMember.NomorMember);
    writeln(f);
    writeln(f,garis);
    close(f);

    writeln('Pendaftaran member berhasil!');
    readln;
end;


procedure TampilkanMenu;
begin
    clrscr;
    writeln('===== Program Kasir Supermarket =====');
    writeln('1. Belanja sebagai Member');
    writeln('2. Pendaftaran Member');
    writeln('3. Keluar');
end;


procedure HitungDiskon(var totalakhir, diskon, diskonMusiman, totalPembayaran: real);
var
    waktu: TDateTime;
    year, month, day: Word;
begin
    waktu := now;
    DecodeDate(waktu, year, month, day);
    if month = 12 then 
        diskonMusiman := 0.05 
    else if month = 8 then 
        diskonMusiman := 0.1 
    else if month = 4 then 
        diskonMusiman := 0.05
    else
        diskonMusiman := 0; 
    if totalakhir < 100000 then
        diskon := 0
    else if (totalakhir >= 100000) and (totalakhir <= 500000) then
        diskon := 0.05
    else if (totalakhir > 500000) and (totalakhir <= 1000000) then
        diskon := 0.1
    else
        diskon := 0.15;

end;

procedure belanja;
begin
    clrscr;
    totalakhir:= 0;
    repeat
    harga:=0;
    writeln('1. Sesi Sembako');
    writeln('2. Sesi Barang rumah tangga');
    writeln('3. Beauty and Health care');
    writeln('4. Alat tulis dan perlengkapan kantor');
    writeln('5. Hewan Peliharaan');
    read(n);
    Clrscr;
    case (n) of
        1 :
            begin
                clrscr;
                writeln ('    1  Sania Beras 5kg                      1pcs | Rp74.000');
                writeln ('    2  Beras Pandan Wangi 10kg              1pcs | Rp155.000');
                writeln ('    3  Gula Rose brand 1kg                  1pcs | Rp16.750');
                writeln ('    4  Indomie (all variant)                1pcs | Rp3.500');
                writeln ('    5  Mie Sedap (all variant)              1pcs | Rp3.500');
                writeln ('    6  Kanzler Chicken Nugget 450gr         1pcs | Rp43.000');
                writeln ('    7  Frisian Flag Kental Manis 370gr      1pcs | Rp20.000');
                writeln ('    8  SariWangi 100% Teh Asli 1.85g isi 30 1pcs | Rp7.500');
                writeln ('    9  SariWangi Teh Melati isi 25          1pcs | Rp8.600');
                writeln ('    10 Kapal Api Special Merah 380g         1pcs | Rp37.000');
                writeln ('    11 Caffino Ice Chocomalt isi 9          1pcs | Rp18.000');
                writeln ('    12 Segitiga Biru tepung serbaguna 1kg   1pcs | Rp10.500');
                writeln ('    13 Tepung beras Rose brand 500g         1pcs | Rp7.500');
                writeln ('    14 Tepung maizena Maizenaku 1kg         1pcs | Rp23.000');
                readln(n1);
                case (n1) of
                    1 : begin
                        barang:='Sania Beras 5kg';
                        harga:=74000;
                    end;
                    2 : begin
                        barang:='Sania Beras 5kg                      1pcs | Rp74.000';
                        harga:=155000;
                    end;
                    3 : begin
                        barang:='Beras Pandan Wangi 10kg              1pcs | Rp155.000';
                        harga:=16750;
                    end;
                    4 : begin
                        barang:='Gula Rose brand 1kg                  1pcs | Rp16.750';
                        harga:=3500;
                    end;
                    5 : begin
                        barang:='Indomie (all variant)                1pcs | Rp3.500';
                        harga:=3500;
                    end;
                    6 : begin
                        barang:='Kanzler Chicken Nugget 450gr         1pcs | Rp43.000';
                        harga:=43000;
                    end;
                    7 : begin
                        barang:='Frisian Flag Kental Manis 370gr      1pcs | Rp20.000';
                        harga:=20000;
                    end;
                    8 : begin
                        barang:='SariWangi 100% Teh Asli 1.85g isi 30 1pcs | Rp7.500';
                        harga:=7500;
                    end;
                    9 :  begin
                        barang:='SariWangi Teh Melati isi 25          1pcs | Rp8.600';
                        harga:=8600;
                    end;
                    10 : begin
                        barang:='Kapal Api Special Merah 380g         1pcs | Rp37.000';
                        harga:=37000;
                    end;
                    11 : begin
                        barang:='Caffino Ice Chocomalt isi 9          1pcs | Rp18.000';
                        harga:=18000;
                    end; 
                    12 :begin
                        barang:='Segitiga Biru tepung serbaguna 1kg   1pcs | Rp10.500';
                        harga:=10500;
                    end;
                    13 : begin
                        barang:='Tepung beras Rose brand 500g         1pcs | Rp7.500';
                        harga:=7500;
                    end;
                    14 : begin
                        barang:='Tepung maizena Maizenaku 1kg         1pcs | Rp23.000';
                        harga:=23000;
                    end;
                end;
            end;
        2 :
            begin
                clrscr;
                    writeln ('    1  Keset kamar mandi 40 cm x 60 cm      1pcs | Rp24.900');
                    writeln ('    2  Bagus Kapur Ajaib 3s                 1pcs | Rp10.000');
                    writeln ('    3  Stella Spray 400ml                   1pcs | Rp23.000');
                    writeln ('    4  Stella gantung Air Freshener 30gr    1pcs | Rp9.399');
                    writeln ('    5  Hit Aerosol Spray Orange 675ml       1pcs | Rp32.750');
                    writeln ('    6  Hit Mat Classic [48+6 Sheets]        1pcs | Rp12.600');
                    writeln ('    7  Concreate Vas Bunga Talisha          1pcs | Rp69.000');
                    writeln ('    8  Bunga Lavender Plastik Artificial    1pcs | Rp7.000');
                    writeln ('    9  Telapak Meja Waterproof 137 x 183 cm 1pcs | Rp199.500');
                    writeln ('    10 Kemoceng Sulak Bulu Sintetis 4ocm    1pcs | Rp9.000');
                    writeln ('    11 Nagoya Sapu Nilon Love               1pcs | Rp20.825');
                    writeln ('    12 Sisir SQ3807                         1pcs | Rp7.800');
                    writeln ('    13 Informa Set 8 Pcs Hanger Kayu        8pcs | Rp72.900');
                    writeln ('    14 Daia Deterjen Bubuk Violet 4 kg      1pcs | Rp55.000');
                readln(n1);
                case (n1) of
                    1 : begin
                        barang:='Keset kamar mandi 40 cm x 60 cm      1pcs | Rp24.900';
                        harga:=24900;
                    end;
                    2 : begin
                        barang:='Bagus Kapur Ajaib 3s                 1pcs | Rp10.000';
                        harga:=10000;
                    end;
                    3 : begin
                        barang:='Stella Spray 400ml                   1pcs | Rp23.000';
                        harga:=23000;
                    end;
                    4 : begin
                        barang:='Stella gantung Air Freshener 30gr    1pcs | Rp9.399';
                        harga:=9399;
                    end;
                    5 : begin
                        barang:='Hit Aerosol Spray Orange 675ml       1pcs | Rp32.750';
                        harga:=32750;
                    end;
                    6 : begin
                        barang:='Hit Mat Classic [48+6 Sheets]        1pcs | Rp12.600';
                        harga:=12600;
                    end;
                    7 : begin
                        barang:='Concreate Vas Bunga Talisha          1pcs | Rp69.000';
                        harga:=69000;
                    end;
                    8 : begin
                        barang:='Bunga Lavender Plastik Artificial    1pcs | Rp7.000';
                        harga:=7000;
                    end;
                    9 :  begin
                        barang:='Telapak Meja Waterproof 137 x 183 cm 1pcs | Rp199.500';
                        harga:=199500;
                    end;
                    10 : begin
                        barang:='Kemoceng Sulak Bulu Sintetis 4ocm    1pcs | Rp9.000';
                        harga:=9000;
                    end;
                    11 : begin
                        barang:='Nagoya Sapu Nilon Love               1pcs | Rp20.825';
                        harga:=20825;
                    end; 
                    12 :begin
                        barang:='Sisir SQ3807                         1pcs | Rp7.800';
                        harga:=7800;
                    end;
                    13 : begin
                        barang:='Informa Set 8 Pcs Hanger Kayu        8pcs | Rp72.900';
                        harga:=72900;
                    end;
                    14 : begin
                        barang:='Daia Deterjen Bubuk Violet 4 kg      1pcs | Rp55.000';
                        harga:=55000;
                    end;
                end;
            end;
        3 :
            begin
                clrscr;
                    writeln ('    1  Kahf Sunscreen  SPF 30 30ml          1pcs | Rp42.300');
                    writeln ('    2  Emina Sunscreen SPF 30 60ml          1pcs | Rp32.500');
                    writeln ('    3  Lux body wash 400ml                  1pcs | Rp23.000');
                    writeln ('    4  Lifebouy body wash Refill 400ml      1pcs | Rp23.000');
                    writeln ('    5  Pepsodent Complete 8 Plus 210g       1pcs | Rp23.500');
                    writeln ('    6  Pepsodent Pencegah Berlubang 225g    1pcs | Rp16.900');
                    writeln ('    7  Pepsodent Complete 8 Plus 210g       1pcs | Rp23.500');
                    writeln ('    8  Pantene Shampoo Anti Dandruff 160ml  1pcs | Rp32.500');
                    writeln ('    9  Dove Shampo Hairfall 900ml           1pcs | Rp76.768');
                    writeln ('    10 Tresemme Keratin Shampoo 900ml       1pcs | Rp82.000');
                    writeln ('    11 Dove Hyaluron Conditioner 450ml      1pcs | Rp90.900');
                    writeln ('    12 Pantene Conditioner Strength 70ml    1pcs | Rp19.900');
                readln(n1);
                case (n1) of
                 1 : begin
                        barang:='Kahf Sunscreen  SPF 30 30ml          1pcs | Rp42.300';
                        harga:=42300;
                    end;
                    2 : begin
                        barang:='Emina Sunscreen SPF 30 60ml          1pcs | Rp32.500';
                        harga:=32500;
                    end;
                    3 : begin
                        barang:='Lux body wash 400ml                  1pcs | Rp23.000';
                        harga:=23000;
                    end;
                    4 : begin
                        barang:='Lifebouy body wash Refill 400ml      1pcs | Rp23.000';
                        harga:=23000;
                    end;
                    5 : begin
                        barang:='Pepsodent Complete 8 Plus 210g       1pcs | Rp23.500';
                        harga:=23500;
                    end;
                    6 : begin
                        barang:='Pepsodent Complete 8 Plus 210g       1pcs | Rp23.500';
                        harga:=16900;
                    end;
                    7 : begin
                        barang:='Pepsodent Complete 8 Plus 210g       1pcs | Rp23.500';
                        harga:=23500;
                    end;
                    8 : begin
                        barang:='Pantene Shampoo Anti Dandruff 160ml  1pcs | Rp32.500';
                        harga:=32500;
                    end;
                    9 :  begin
                        barang:='Dove Shampo Hairfall 900ml           1pcs | Rp76.768';
                        harga:=76768;
                    end;
                    10 : begin
                        barang:='Tresemme Keratin Shampoo 900ml       1pcs | Rp82.000l';
                        harga:=82000;
                    end;
                    11 : begin
                        barang:='Dove Hyaluron Conditioner 450ml      1pcs | Rp90.900';
                        harga:=90900;
                    end; 
                    12 :begin
                        barang:='Pantene Conditioner Strength 70ml    1pcs | Rp19.900';
                        harga:=19900;
                    end;
                end;
            end;
        4 :
            begin
                clrscr;
                    writeln ('    1  Pulpen Gel Joyko JK-100NT            1pcs | Rp1.700');
                    writeln ('    2  TOMBOW Correction tape 5 mm x 6 mm   1pcs | Rp9.000');
                    writeln ('    3  Rautan MAPED I-GLOO Sharpener        1pcs | Rp10.000');
                    writeln ('    4  Penghapus Joyko hitam kecil          1pcs | Rp2.000');
                    writeln ('    5  PRONTO Pencil Lead 2B                1pcs | Rp2.610');
                    writeln ('    6  PRONTO Clear Holder A4 isi 10 Lembar 1pcs | Rp13.230');
                    writeln ('    7  PaperOne Kertas Fotocopy A4 80gr     1pcs | Rp241.400');
                    writeln ('    8  Bambi Mini desk                      1pcs | Rp15.000');
                    writeln ('    9  MAPED Adhesive Tape Dispenser In Box 1pcs | Rp70.000');
                    writeln ('    10 PP Lite A4 75gr                      1pcs | Rp40.100');
                    writeln ('    11 Bambi ECO NOTE Notebook              1pcs | Rp8.800');
                    writeln ('    12 PRONTO Glue Stick                    1pcs | Rp7.380');
                    writeln ('    13 MAPED Koopy Gunting                  1pcs | Rp18.500');
                    writeln ('    14 PRONTO Cutter 9 mm                   1pcs | Rp9.270');
                    writeln ('    15 PRONTO Sticknote 50 X 50mm - Set 5   1pcs | Rp17.710');
                readln(n1);
                case (n1) of
                    1 : begin
                        barang:='Pulpen Gel Joyko JK-100NT            1pcs | Rp1.700';
                        harga:=1700;
                    end;
                    2 : begin
                        barang:='TOMBOW Correction tape 5 mm x 6 mm   1pcs | Rp9.000';
                        harga:=9000;
                    end;
                    3 : begin
                        barang:='Rautan MAPED I-GLOO Sharpener        1pcs | Rp10.000';
                        harga:=10000;
                    end;
                    4 : begin
                        barang:='Penghapus Joyko hitam kecil          1pcs | Rp2.000';
                        harga:=2000;
                    end;
                    5 : begin
                        barang:='PRONTO Pencil Lead 2B                1pcs | Rp2.610';
                        harga:=2610;
                    end;
                    6 : begin
                        barang:='PRONTO Clear Holder A4 isi 10 Lembar 1pcs | Rp13.230';
                        harga:=13230;
                    end;
                    7 : begin
                        barang:='PaperOne Kertas Fotocopy A4 80gr     1pcs | Rp241.400';
                        harga:=241400;
                    end;
                    8 : begin
                        barang:='Bambi Mini desk                      1pcs | Rp15.000';
                        harga:=15000;
                    end;
                    9 :  begin
                        barang:='MAPED Adhesive Tape Dispenser In Box 1pcs | Rp70.000';
                        harga:=70000;
                    end;
                    10 : begin
                        barang:='PP Lite A4 75gr                      1pcs | Rp40.100';
                        harga:=40100;
                    end;
                    11 : begin
                        barang:='Bambi ECO NOTE Notebook              1pcs | Rp8.800';
                        harga:=20825;
                    end; 
                    12 :begin
                        barang:='PRONTO Glue Stick                    1pcs | Rp7.380';
                        harga:=8800;
                    end;
                    13 : begin
                        barang:='MAPED Koopy Gunting                  1pcs | Rp18.500';
                        harga:=18500;
                    end;
                    14 : begin
                        barang:='PRONTO Cutter 9 mm                   1pcs | Rp9.270';
                        harga:=9270;
                    end;
                    15 : begin
                        barang:='PRONTO Sticknote 50 X 50mm - Set 5   1pcs | Rp17.710';
                        harga:=17710;
                    end;
                end;
            end;
        5 :
            begin
                clrscr;
                    writeln ('    1  Woodplay Brush Bone Mainan Tulang    1pcs | Rp59.900');
                    writeln ('    2  SmartHeart Creamy Cat Tuna 60g       1pcs | Rp28.900');
                    writeln ('    3  MeO Makanan Kucing Basah Adult 400g  1pcs | Rp23.900');
                    writeln ('    4  MeO Cat Snack Treat Rasa Katsuo 60g  1pcs | Rp27.900');
                    writeln ('    5  Royal Canin Hair and Skin Care 400g  1pcs | Rp57.500');
                    writeln ('    6  Whiskas Dry Adult 1+ 480g            1pcs | Rp26.900');
                    writeln ('    7  Detick Obat Kutu Kucing Anjing 3ml   1pcs | Rp31.360');
                    writeln ('    8  Pet Kingdom Clumping Cat Litter 10lt 1pcs | Rp93.415');
                    writeln ('    9  Kandang Kucing Pet cargo 38x23x30 Mx 1pcs | Rp75.000');
                    writeln ('    10 Pawise Sekop Ktoran Litter 28cm5gr   1pcs | Rp9.600');
                    writeln ('    11 FOCAT Cat Litter Box M06             1pcs | Rp46.899');
                readln(n1);
                case (n1) of
                    1 : begin
                        barang:='Woodplay Brush Bone Mainan Tulang    1pcs | Rp59.900';
                        harga:=59900;
                    end;
                    2 : begin
                        barang:='SmartHeart Creamy Cat Tuna 60g       1pcs | Rp28.900';
                        harga:=28900;
                    end;
                    3 : begin
                        barang:='MeO Makanan Kucing Basah Adult 400g  1pcs | Rp23.900';
                        harga:=23900;
                    end;
                    4 : begin
                        barang:='MeO Cat Snack Treat Rasa Katsuo 60g  1pcs | Rp27.900';
                        harga:=27900;
                    end;
                    5 : begin
                        barang:='Royal Canin Hair and Skin Care 400g  1pcs | Rp57.500';
                        harga:=57500;
                    end;
                    6 : begin
                        barang:='Whiskas Dry Adult 1+ 480g            1pcs | Rp26.900';
                        harga:=26900;
                    end;
                    7 : begin
                        barang:='Detick Obat Kutu Kucing Anjing 3ml   1pcs | Rp31.360';
                        harga:=31360;
                    end;
                    8 : begin
                        barang:='Pet Kingdom Clumping Cat Litter 10lt 1pcs | Rp93.415';
                        harga:=93415;
                    end;
                    9 :  begin
                        barang:='Kandang Kucing Pet cargo 38x23x30 Mx 1pcs | Rp75.00';
                        harga:=75000;
                    end;
                    10 : begin
                        barang:='Pawise Sekop Ktoran Litter 28cm5gr   1pcs | Rp9.600';
                        harga:=9600;
                    end;
                    11 : begin
                        barang:='FOCAT Cat Litter Box M06             1pcs | Rp46.899';
                        harga:=46899;
                    end;
                end;
            end;
        
    end;
    //hitung total
    writeln('berapa jumlah barang yang mau dibeli?');
    readln(x);
    totalakhir:= totalakhir + (harga*x);
    //pointer
    p := @totalakhir;
    Clrscr;
    write('apakah ada yang masih ingin dibeli?(Y/N)');
    readln(yn);
    upyn:=upcase(yn);
    until (upyn= 'N');

    HitungDiskon(p^, diskon, diskonMusiman, totalPembayaran);  
    writeln('total belanja : ', p^:0:0);  // Modify this line
    totalPembayaran := p^ - (p^ * (diskon + diskonMusiman));
    writeln('total setelah diskon : ', totalPembayaran:0:0);
    // poin
    BelanjaSebagaiMember;



    //struk
    filename := 'Struk Belanja.txt'; //pembuatan file
    Assign(f, filename);
    waktu:=now;
    //isi kartu member
    rewrite(f);
    writeln(f, '============================================');
    writeln(f, '                Struk Bon');
    writeln(f, '============================================');
    writeln(f, 'Tanggal                 : ', FormatDateTime('dd/mm/yyyy', waktu));
    writeln(f, 'Jam                     : ', FormatDateTime('hh:nn:ss', waktu));
    writeln(f, 'Rincian Harga');
    //rincian barang
    writeln(f, '    Total Biaya             : Rp', totalakhir:0:0);
    writeln(f, '    Total dengan diskon     : Rp', totalPembayaran:0:0);
    writeln(f,' ');
    writeln(f, 'Terimakasih sudah berbelanja di css!');
    writeln(f, '============================================');
    close(f);
    writeln('Struk telah dicetak!');
    readln;
end;


procedure Main;
var
    Pilihan: integer;
begin
    repeat
        TampilkanMenu;
        write('Masukkan pilihan Anda: ');
        readln(Pilihan);

        case Pilihan of
            1: Belanja;
            2: PendaftaranMember;
        end;
    until Pilihan = 3;
end;

begin //program utama
    Main;
end.
