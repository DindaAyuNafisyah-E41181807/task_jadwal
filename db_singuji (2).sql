-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2020 pada 13.46
-- Versi server: 10.1.40-MariaDB
-- Versi PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_singuji`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_mapel`
--

CREATE TABLE `tb_detail_mapel` (
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `NIP` varchar(20) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `nama_guru` varchar(70) NOT NULL,
  `status` enum('administrator','guru') NOT NULL,
  `username_guru` varchar(50) NOT NULL,
  `password_guru` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`NIP`, `id_mapel`, `id_jurusan`, `nama_guru`, `status`, `username_guru`, `password_guru`) VALUES
('1234567890189', 'MP003', 'JRS001', 'hayati', 'guru', 'hayati', '73e405227c02a626e66f0dc4dd3a53a3'),
('196001281989111002', 'MP001', 'JRS001', 'Drs. Nyamid Setiaji', 'guru', '196001281989111002', '0807a2e9201d8b789bac7f2d9ad1e1d3'),
('196007011986011003', 'MP005', 'JRS001', 'Robani, S.Pd', 'guru', '196007011986011003', 'c8cf7c1e200d79a6807df53ddc9471a7'),
('196111291988032005', 'MP003', 'JRS001', 'Dra. Hj. Tri Wahyuti', 'guru', '196111291988032005', '251762ed14befd81eeb672b57e576999'),
('196311071990031009', 'MP003', 'JRS001', 'Drs. Tohar Ahmad', 'guru', '196311071990031009', 'db2c391e600a69517150040b3cc0453c'),
('196312241989032006', 'MP004', 'JRS002', 'Dra. Sri Hamimi', 'guru', '196312241989032006', 'f4dbacdaa0f485fa6ce28d4fdb15252e'),
('196402211999031003', 'MP005', 'JRS001', 'Eko Subiyantoro, S.Pd', 'administrator', '196402211999031003', 'e0b1ec13d648bfd0c0203f71f7a7ca84'),
('196506241989012004', 'MP005', 'JRS001', 'Nur Qomari, S.Pd', 'administrator', '196506241989012004', '7366bc59ce8b682787fbd4a0722c8966'),
('197006101998022001', 'MP007', 'JRS001', 'Jujun Endah Pratiwi, S.Pd', 'guru', '197006101998022001', '0c0dc52de32e3e04718ed1c76c091374'),
('197405212007012011', 'MP002', 'JRS002', 'Yayuk Sri Rahayu B, SE', 'guru', '197405212007012011', '749e178282f18a2ffa4ce026f263fb18'),
('197810062003122006', 'MP006', 'JRS002', 'Yetty Noermaningsih, S.Pd, M.Pd', 'guru', '197810062003122006', '20dc04c1ca57c8761b73c38db1d75b5f');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jawaban`
--

CREATE TABLE `tb_jawaban` (
  `id_jawaban` varchar(9) NOT NULL,
  `NIS` varchar(4) NOT NULL,
  `id_ujian` varchar(9) NOT NULL,
  `id_soal` varchar(9) NOT NULL,
  `jawaban` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_soal`
--

CREATE TABLE `tb_jenis_soal` (
  `id_jenis_soal` varchar(9) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jenis_soal`
--

INSERT INTO `tb_jenis_soal` (`id_jenis_soal`, `jenis`) VALUES
('JNS001', 'Pilihan Ganda'),
('JNS002', 'Essay'),
('JNS004', 'Sorting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jurusan` varchar(9) NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jurusan`, `jurusan`) VALUES
('JRS001', 'IPA'),
('JRS002', 'IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` varchar(9) NOT NULL,
  `mata_pelajaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `mata_pelajaran`) VALUES
('MP001', 'PPKn'),
('MP002', 'Ekonomi'),
('MP003', 'Biologi'),
('MP004', 'Bahasa Indonesia'),
('MP005', 'Matematika'),
('MP006', 'Sosiologi'),
('MP007', 'Fisika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` varchar(9) NOT NULL,
  `id_ujian` varchar(9) NOT NULL,
  `NIS` varchar(4) NOT NULL,
  `nilai` int(3) NOT NULL,
  `tanggal_nilai` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket_soal`
--

CREATE TABLE `tb_paket_soal` (
  `id_paket` varchar(9) NOT NULL,
  `NIP` varchar(20) NOT NULL,
  `nama_paket` varchar(200) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `tgl_pembuatan` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_paket_soal`
--

INSERT INTO `tb_paket_soal` (`id_paket`, `NIP`, `nama_paket`, `id_jurusan`, `id_mapel`, `tgl_pembuatan`) VALUES
('PKT001', '196001281989111002', 'Belajar Uji Coba', 'JRS001', 'MP001', '20/04/2020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `NIS` varchar(4) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan') NOT NULL,
  `kelas` enum('10','11','12') NOT NULL,
  `semester` enum('Ganjil','Genap') NOT NULL,
  `username_siswa` varchar(50) NOT NULL,
  `password_siswa` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` varchar(9) NOT NULL,
  `id_paket` varchar(9) NOT NULL,
  `id_jenis_soal` varchar(9) NOT NULL,
  `pertanyaan` longtext NOT NULL,
  `opsi_a` varchar(200) NOT NULL,
  `opsi_b` varchar(200) NOT NULL,
  `opsi_c` varchar(200) NOT NULL,
  `opsi_d` varchar(200) NOT NULL,
  `opsi_e` varchar(200) NOT NULL,
  `nama_file` varchar(200) NOT NULL,
  `kunci_jawaban` varchar(20) NOT NULL,
  `pembahasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `id_paket`, `id_jenis_soal`, `pertanyaan`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `nama_file`, `kunci_jawaban`, `pembahasan`) VALUES
('S001', 'PKT001', 'JNS002', 'iyyas', '', '', '', '', '', '', 'apaa', 'oke'),
('SL001', 'PKT001', 'JNS004', '<p>Urutkan menjadi kalimat yang benar ?</p>\r\n\r\n<ol>\r\n	<li>Kamu</li>\r\n	<li>Pergi</li>\r\n	<li>Dia</li>\r\n	<li>Mengapa</li>\r\n	<li>?</li>\r\n</ol>\r\n', '', '', '', '', '', '', '<p>ukey</p>\r\n', '<p>uhh masak</p>\r\n'),
('SL0010', 'PKT001', 'JNS004', '<p>iyya</p>\r\n', '', '', '', '', '', '', '<p>iyyayaaa</p>\r\n', '<p>oke</p>\r\n'),
('SL003', 'PKT001', 'JNS001', '<p>Apa isi sila pertama pancasila ?</p>\r\n', '<p>oke</p>\r\n', '<p>apa aja dah</p>\r\n', '<p>iyaa</p>\r\n', '<p>Ketuhanan yang maha esa</p>\r\n', '<p>apadah</p>\r\n', '', 'D', '<p>Ketuhanan yang maha Esa</p>\r\n'),
('SL005', 'PKT001', 'JNS002', '<p>oke</p>\r\n', '', '', '', '', '', '', '<p>iya</p>\r\n', '<p>apa</p>\r\n'),
('SL006', 'PKT001', 'JNS004', '<p>hasim</p>\r\n', '', '', '', '', '', '', '<p>5 4 3 2 1</p>\r\n', '<p>hoh</p>\r\n'),
('SL007', 'PKT001', 'JNS001', '<p>HAHA</p>\r\n', '<p>HI</p>\r\n', '<p>HU</p>\r\n', '<p>iyA</p>\r\n', '<p>HO</p>\r\n', '<p>IH</p>\r\n', '', 'C', '<p>GAGGA</p>\r\n'),
('SL009', 'PKT001', 'JNS001', '<p>iya</p>\r\n', '', '<p>siap</p>\r\n', '<p>iya</p>\r\n', '<p>iyasu</p>\r\n', '<p>si</p>\r\n', '', 'A', '<p>yafa</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tipe_ujian`
--

CREATE TABLE `tb_tipe_ujian` (
  `id_tipe` varchar(9) NOT NULL,
  `tipe_ujian` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_tipe_ujian`
--

INSERT INTO `tb_tipe_ujian` (`id_tipe`, `tipe_ujian`) VALUES
('T001', 'QUIZ '),
('T002', 'UTS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ujian`
--

CREATE TABLE `tb_ujian` (
  `id_ujian` varchar(9) NOT NULL,
  `NIP` varchar(20) NOT NULL,
  `id_mapel` varchar(9) NOT NULL,
  `id_jurusan` varchar(9) NOT NULL,
  `id_jenis_soal` varchar(9) NOT NULL,
  `id_tipe` varchar(9) NOT NULL,
  `jumlah_soal` int(3) NOT NULL,
  `waktu_mengerjakan` int(3) NOT NULL,
  `waktu_mulai` datetime(6) NOT NULL,
  `token_soal` varchar(20) NOT NULL,
  `status_ujian` enum('Aktif','Non - Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_ujian`
--

INSERT INTO `tb_ujian` (`id_ujian`, `NIP`, `id_mapel`, `id_jurusan`, `id_jenis_soal`, `id_tipe`, `jumlah_soal`, `waktu_mengerjakan`, `waktu_mulai`, `token_soal`, `status_ujian`) VALUES
('U001', '196111291988032005', 'MP002', 'JRS002', 'JNS001', 'T001', 30, 60, '2020-06-22 08:00:00.000000', '111111111111111', 'Aktif'),
('U002', '196506241989012004', 'MP003', 'JRS001', 'JNS004', 'T002', 45, 120, '2020-06-17 09:00:00.000000', '256521734781254', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_mapel`
--
ALTER TABLE `tb_detail_mapel`
  ADD KEY `index_mapel` (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `index_mapel` (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `index_nis` (`NIS`),
  ADD KEY `index_ujian` (`id_ujian`),
  ADD KEY `index_soal` (`id_soal`);

--
-- Indeks untuk tabel `tb_jenis_soal`
--
ALTER TABLE `tb_jenis_soal`
  ADD PRIMARY KEY (`id_jenis_soal`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `index_ujian` (`id_ujian`),
  ADD KEY `index_nis` (`NIS`);

--
-- Indeks untuk tabel `tb_paket_soal`
--
ALTER TABLE `tb_paket_soal`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `index_nip` (`NIP`),
  ADD KEY `index_jurusan` (`id_jurusan`),
  ADD KEY `index_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `index_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `index_paket` (`id_paket`),
  ADD KEY `index_jenis` (`id_jenis_soal`);

--
-- Indeks untuk tabel `tb_tipe_ujian`
--
ALTER TABLE `tb_tipe_ujian`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indeks untuk tabel `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `index_nip` (`NIP`),
  ADD KEY `index_mapel` (`id_mapel`),
  ADD KEY `index_jurusan` (`id_jurusan`),
  ADD KEY `index_jenis` (`id_jenis_soal`),
  ADD KEY `index_tipe` (`id_tipe`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_mapel`
--
ALTER TABLE `tb_detail_mapel`
  ADD CONSTRAINT `tb_detail_mapel_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_mapel_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD CONSTRAINT `tb_guru_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_guru_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD CONSTRAINT `tb_jawaban_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `tb_siswa` (`NIS`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_2` FOREIGN KEY (`id_ujian`) REFERENCES `tb_ujian` (`id_ujian`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jawaban_ibfk_3` FOREIGN KEY (`id_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`id_ujian`) REFERENCES `tb_ujian` (`id_ujian`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`NIS`) REFERENCES `tb_siswa` (`NIS`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_paket_soal`
--
ALTER TABLE `tb_paket_soal`
  ADD CONSTRAINT `tb_paket_soal_ibfk_2` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_paket_soal_ibfk_3` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_paket_soal_ibfk_4` FOREIGN KEY (`NIP`) REFERENCES `tb_guru` (`NIP`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket_soal` (`id_paket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`id_jenis_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_ujian`
--
ALTER TABLE `tb_ujian`
  ADD CONSTRAINT `tb_ujian_ibfk_1` FOREIGN KEY (`id_tipe`) REFERENCES `tb_tipe_ujian` (`id_tipe`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `tb_guru` (`NIP`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `tb_mapel` (`id_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_4` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ujian_ibfk_5` FOREIGN KEY (`id_jenis_soal`) REFERENCES `tb_jenis_soal` (`id_jenis_soal`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
