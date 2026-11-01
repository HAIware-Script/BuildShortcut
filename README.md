#Ringkasan Point-Point penggunaan

*Diawal layar jendela putih cmd, anda akan dimintai input lokasi yang menjadi tempat shortcut dibuat.
Contoh: C:\Users\Windows 10\Desktop mau anda menggunakan tanda kutip double atau tidak, maka di batch tanda " akan di hapus.

*Setelah anda sudah menginput lokasi path destination, maka anda selanjut-nya anda akan dimintai input lokasi
file yang ingin dijadikan shortcut misal, Google Chrome atau OBS Studio, (C:\Program Files(x86)\Google Chrome\chrome\chrome.exe)

*Sampai anda di input terakhir, anda akan di mintai nama shourcut yang ingin dibuat misal.. karena umum-nya nama path file itu
sudah bawaan chrome.exe maka kita bisa ubah menjadi Google Chrome biar jauh lebih bagus..

setelah itu proses pembuatan shortcut tersebut menggunakan command (powershell) :)

*Sebenar-nya ada (command/prompt) rahasia.. kalau anda menyadari-nya setelah menginput lokasi path destination
maka anda akan melihat tulisan [USER] dan ini bisa diubah ke Administrators tetapi.. begini rumus-nya

Ketik:

*USER = Berjalan sebagai hak user
*UAC  = Berjalan sebagai hak administrators jadi saya tidak memprogram untuk meminta anda menginput tulisan administrator
        karena itu cukup panjang maka saya jadikan "UAC" dan anda ketik UAC maka.. tulisan di kurung kotak menjadi [UAC] =Admin
