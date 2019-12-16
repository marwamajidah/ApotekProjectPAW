-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2019 pada 02.57
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotekpaw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pemesanan`
--

CREATE TABLE `detail_pemesanan` (
  `id` int(4) NOT NULL,
  `kode_pesan` varchar(7) NOT NULL,
  `kode_obat` char(5) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pemesanan`
--

INSERT INTO `detail_pemesanan` (`id`, `kode_pesan`, `kode_obat`, `jumlah`) VALUES
(1, '8X60SSU', 'A0001', 1),
(2, '8X60SSU', 'A0002', 20),
(6, '2GH3B48', 'A0001', 26),
(7, '2GH3B48', 'A0002', 33),
(8, '2GH3B48', 'C0001', 13),
(9, 'FAVEJLI', 'B0002', 30),
(10, 'FAVEJLI', 'C0001', 25),
(11, 'FAVEJLI', 'A0004', 30),
(12, 'Q6X46CZ', 'A0001', 15),
(13, 'Q6X46CZ', 'A0003', 20),
(14, 'Q6X46CZ', 'C0001', 10),
(15, 'UBEV4VC', 'A0001', 200),
(16, 'UBEV4VC', 'A0002', 10),
(18, 'S244QXZ', 'D0001', 20),
(19, 'S244QXZ', 'A0004', 10),
(21, 'HACW9GN', 'D0001', 5),
(22, 'HACW9GN', 'A0001', 20),
(24, 'SWWY31J', 'C0001', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(4) NOT NULL,
  `kode_obat` char(5) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `id_session` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id`, `kode_obat`, `jumlah`, `id_session`) VALUES
(21, 'A0001', 10, 'aysho3ajxv6ounnldf3k9n47sr68sxlspz5aqwkx'),
(22, 'A0002', 20, 'aysho3ajxv6ounnldf3k9n47sr68sxlspz5aqwkx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `kode_obat` char(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bentuk` varchar(100) NOT NULL,
  `konsumen` varchar(100) NOT NULL,
  `manfaat` varchar(200) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`kode_obat`, `nama`, `bentuk`, `konsumen`, `manfaat`, `harga`) VALUES
('A0001', 'Acarbose', 'Tablet, Kapsul', 'Dewasa', 'Mengontrol kadar gula dalam darah', 5000),
('A0002', 'Albumin', 'Obat infus', 'Dewasa', 'Menangani defisiensi albumin', 10000),
('A0003', 'Amfetamin', 'Tablet, kapsul, dan puyer', 'Dewasa dan anak-anak', 'Menangani ADHD, mengobati narkolepsi, menurunkan berat badan', 12500),
('A0004', 'Atenolol', 'Tablet', 'Dewasa', 'Mengobati angina, gangguan detak jantung, dan hipertensi. Menjaga kesehatan jantung Menjaga kesehatan jantu setelah serangan jantung', 25000),
('B0001', 'Bacitracin', 'Suntik', 'Dewasa dan anak-anak', 'Mencegah infeksi bakteri pada luka ringan di kulit', 15000),
('B0002', 'Baclofen', 'Tablet', 'Dewasa dan anak-anak', 'Meredakan kejang otot', 32000),
('C0001', 'Captopril', 'Tablet', 'Dewasa', 'Menangani hipertensi, mencegah komplikasi setelah serangan jantung', 52000),
('D0001', 'Diazepam', 'Tablet, Obat cair, Suntikan', 'Dewasa dan anak-anak', 'Mengatasi insomnia, serangan kecemasan, melemaskan otot kejang', 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id`, `nama`) VALUES
('21120116120002', 'Kemal Yusron Hasibuan'),
('21120116130037', 'Ali Sajidin'),
('21120116130065', 'Adam Maulidani'),
('21120116140068', 'Fanny Hasbi'),
('21120116140069', 'Fajar Nahari'),
('21120116140070', 'Azizah Kamalia'),
('21120116140077', 'Kelvin John'),
('21120116140078', 'Jeremy Kharisma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `kode_pesan` varchar(7) NOT NULL,
  `id_pemesan` varchar(20) NOT NULL,
  `harga` float NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('B','L') NOT NULL DEFAULT 'B',
  `konfirmasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`kode_pesan`, `id_pemesan`, `harga`, `tanggal`, `status`, `konfirmasi`) VALUES
('2GH3B48', '21120116140070', 1136000, '2017-06-09', 'L', '2017-06-09'),
('8X60SSU', '21120116140068', 205000, '2017-06-09', 'L', '2017-06-09'),
('FAVEJLI', '21120116140069', 3010000, '2017-06-09', 'L', '2017-06-09'),
('HACW9GN', '21120116140078', 160000, '2017-06-10', 'B', NULL),
('Q6X46CZ', '21120116120002', 845000, '2017-06-10', 'L', '2017-06-10'),
('S244QXZ', '21120116140077', 490000, '2017-06-10', 'B', NULL),
('SWWY31J', '21120116130065', 520000, '2017-06-10', 'B', NULL),
('UBEV4VC', '21120116130037', 1100000, '2017-06-10', 'B', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `role_id`) VALUES
(1, 'marwa', 'marwa', 'marwa123', 2),
(2, 'hesty', 'putrih', 'putrihesty', 2),
(3, 'ulvia', 'ulvia', 'ulvia123', 2),
(4, 'admin', 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'cashier'),
(3, 'member');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_obat` (`kode_obat`),
  ADD KEY `kode_pesan` (`kode_pesan`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_obat` (`kode_obat`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`kode_pesan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD CONSTRAINT `detail_pemesanan_ibfk_1` FOREIGN KEY (`kode_obat`) REFERENCES `obat` (`kode_obat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detail_pemesanan_ibfk_2` FOREIGN KEY (`kode_pesan`) REFERENCES `pemesanan` (`kode_pesan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
