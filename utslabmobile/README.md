# 🌿 Ghibli Movies App (Flutter)

##  Deskripsi Aplikasi

Ghibli Movies App adalah aplikasi mobile berbasis Flutter yang menampilkan daftar film dari Studio Ghibli menggunakan Public API

---

##  Struktur Folder

```bash
lib/
├── models/        # Model data (Movie)
├── services/      # API & Cache service
├── providers/     # State management (Provider)
├── views/         # UI utama (Home Screen)
├── widgets/       # Reusable components
└── main.dart      # Entry point
```

### Penjelasan:

* **models/** : Menyimpan struktur data (Movie)
* **services/** : Mengelola API call & local cache
* **providers/** : Mengatur state aplikasi
* **views/** : Tampilan utama
* **widgets/** : Komponen UI reusable (card, shimmer)

---

##  Teknologi yang Digunakan

* Flutter
* Dart
* Provider (State Management)
* HTTP Package (API Request)
* Shared Preferences (Offline Cache)
* Shimmer (Loading Effect)

---

##  API yang Digunakan

* Studio Ghibli API
  https://ghibliapi.vercel.app/films

---

##  Fitur Utama

### 1. Fetch Data dari API

* Menggunakan HTTP request
* Data ditampilkan dalam bentuk list film

### 2. Offline Mode (Caching)

* Data disimpan menggunakan SharedPreferences
* Saat offline, aplikasi tetap menampilkan data terakhir

### 3. Error Handling

* Menampilkan pesan user-friendly saat offline
* Menampilkan banner:
  "You are offline (showing cached data)"

### 4. Search Feature

* Pencarian film berdasarkan judul
* Menggunakan async logic (tanpa freeze UI)

### 5. Filter Feature

* Filter berdasarkan director
* Menggunakan dropdown

### 6. Reusable Widgets

* Movie Card
* Loading Shimmer

### 7. Loading State (Shimmer Effect)

* Tampilan loading lebih halus dan modern

---

##  UI & UX Design

Aplikasi menggunakan konsep desain:

* Soft color palette (Ghibli-inspired)
* Rounded card design
* Image overlay untuk judul
* Layout minimalis dan clean

---

##  State Management

Menggunakan **Provider** karena:

* Mudah dipahami dan ringan
* Cocok untuk skala kecil hingga menengah
* Memisahkan logic dari UI
* Mendukung reactive UI update

---

##  Alur Data

1. App memanggil API melalui `ApiService`
2. Data disimpan ke `Provider`
3. Data di-cache menggunakan `CacheService`
4. UI mengambil data dari `Provider`
5. Saat offline maka data diambil dari cache

---

##  Cara Menjalankan Project

```bash
flutter pub get
flutter run
```

---

##  Kesimpulan

Aplikasi ini telah memenuhi semua requirement:

* Modular architecture
* Offline readiness
* Error handling yang user-friendly
* Search & filter feature
* Reusable widgets
* Visual consistency (Shimmer)

---