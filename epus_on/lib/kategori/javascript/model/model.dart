class Js {
  final String id;
  final String judul;
  final String pengarang;
  final String deskripsi;
  final String tgl_terbit;
  final String cover;
  final String link;

  const Js({
    required this.id,
    required this.judul,
    required this.pengarang,
    required this.deskripsi,
    required this.tgl_terbit,
    required this.cover,
    required this.link,
  });

  factory Js.fromJson(Map<String, dynamic> json) {
    return Js(
      id: json['id'],
      judul: json['judul'],
      pengarang: json['pengarang'],
      deskripsi: json['deskripsi'],
      tgl_terbit: json['tgl_terbit'],
      cover: json['cover'],
      link: json['link'],
    );
  }
}
