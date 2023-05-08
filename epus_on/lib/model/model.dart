class Buku {
  final String id;
  final String judul;
  final String cover;
  final String deskripsi;
  final String pengarang;
  final String link;
  final String tgl_terbit;

  const Buku({
    required this.id,
    required this.judul,
    required this.cover,
    required this.deskripsi,
    required this.pengarang,
    required this.link,
    required this.tgl_terbit,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      judul: json['judul'],
      cover: json['cover'],
      deskripsi: json['deskripsi'],
      pengarang: json['pengarang'],
      link: json['link'],
      tgl_terbit: json['tgl_terbit'],
    );
  }
}
