Pada kesempatan kali ini kita akan belajar docker file

Dockerfile berfungsi untuk membuat image sendiri yang mana berisi dependensi dependsi yang sudah kita siapkan,
Dari image yang kita buat melalui dockerfile tersebut kita dapat membuat contaienr dari image tersebut.

Caranya setelah membuat dockerfile cukup jalankan perintah docker build --tag namaimage:tag .

Kita memiliki program sederhana ini dan akan membuat image dari program ini
main.go
```
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World!")
	})

	http.ListenAndServe(":8080", nil)
}
```

Cara menjalankan dilocal adalah go run main.go 
Maka tinggal kita buka dibrowser localhost:8080 akan tampil hello World

Buat file Dockerfile

```
FROM golang:latest

COPY main.go /app/main.go

CMD ["go", "run", "main.go"]

```

Pada Dockerfile terdapat 2 model untuk shell dan exec, jika kita ingin docker menjalankan sebuah perintah alangkah baiknya
menggunakan docker exec yang mana terdapat pada baris 37. CMD ["exec", "param", "param"]

Kemudian untuk FROM golang:latest artinya kita perlue image murni golannya, karena kita menjalankan aplikasi golang

Sedangkan COPY artinya salin file main.go ke dalam /app/

Setelah itu tinggal buat container dari image diatas dengan publish port terlebih dahulu supaya dapat diakses dari host