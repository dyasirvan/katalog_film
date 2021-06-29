
class Film {
  String judul;
  String genre;
  String deskripsi;
  String tglRilis;
  double skor;
  String status;
  String gambarPoster;
  String gambarBackdrop;

  Film({
    required this.judul,
    required this.genre,
    required this.deskripsi,
    required this.tglRilis,
    required this.skor,
    required this.status,
    required this.gambarPoster,
    required this.gambarBackdrop,
  });
}

var filmList = [
  Film(judul: "Cruella",
      genre: "Comedy, Crime",
      deskripsi: "In 1970s London amidst the punk rock revolution, a young grifter named Estella is determined to make a name for herself with her designs. She befriends a pair of young thieves who appreciate her appetite for mischief, and together they are able to build a life for themselves on the London streets. One day, Estella’s flair for fashion catches the eye of the Baroness von Hellman, a fashion legend who is devastatingly chic and terrifyingly haute. But their relationship sets in motion a course of events and revelations that will cause Estella to embrace her wicked side and become the raucous, fashionable and revenge-bent Cruella.",
      tglRilis: "May 26, 2021",
      skor: 8.6,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/rTh4K5uw9HypmpGslcKd4QfHl93.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/6MKr3KgOLmzOP6MSuZERO41Lpkt.jpg"),
  Film(judul: "The Conjuring: The Devil Made Me Do It",
      genre: "Horror, Mystery, Thriller",
      deskripsi: "Paranormal investigators Ed and Lorraine Warren encounter what would become one of the most sensational cases from their files. The fight for the soul of a young boy takes them beyond anything they'd ever seen before, to mark the first time in U.S. history that a murder suspect would claim demonic possession as a defense.",
      tglRilis: "May 25, 2021",
      skor: 8.2,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/qi6Edc1OPcyENecGtz8TF0DUr9e.jpg"),

  Film(judul: "F9",
      genre: "Action, Adventure, Crime",
      deskripsi: "Dominic Toretto and his crew battle the most skilled assassin and high-performance driver they've ever encountered: his forsaken brother.",
      tglRilis: "June 25, 2021",
      skor: 7.9,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/bOFaAXmWWXC3Rbv4u4uM9ZSzRXP.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/xXHZeb1yhJvnSHPzZDqee0zfMb6.jpg"),

  Film(judul: "Army of the Dead",
      genre: "Action, Crime, Science Fiction, Horror, Thriller",
      deskripsi: "Following a zombie outbreak in Las Vegas, a group of mercenaries take the ultimate gamble: venturing into the quarantine zone to pull off the greatest heist ever attempted.",
      tglRilis: "May 14, 2021",
      skor: 6.5,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/z8CExJekGrEThbpMXAmCFvvgoJR.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/9WlJFhOSCPnaaSmsrv0B4zA8iUb.jpg"),

  Film(judul: "Endangered Species",
      genre: "Thriller, Action",
      deskripsi: "Jack Halsey takes his wife, their adult kids, and a friend for a dream vacation in Kenya. But as they venture off alone into a wilderness park, their safari van is flipped over by an angry rhino, leaving them injured and desperate. Then, as two of them go in search of rescue, a bloody, vicious encounter with a leopard and a clan of hyenas incites a desperate fight for survival.",
      tglRilis: "May 27, 2021",
      skor: 6.6,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/ccsSqbpEqr2KK9eMvoeF8ERFCd5.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/A0xW7GgeFQoQmPOn7HcHkBQ5nlb.jpg"),

  Film(judul: "Mortal Kombat",
      genre: "Action, Fantasy, Adventure",
      deskripsi: "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.",
      tglRilis: "Apr 07, 2021",
      skor: 7.5,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/9yBVqNruk6Ykrwc32qrK2TIE5xw.jpg"),

  Film(judul: "The Unholy",
      genre: "Horror",
      deskripsi: "Alice, a young hearing-impaired girl who, after a supposed visitation from the Virgin Mary, is inexplicably able to hear, speak and heal the sick. As word spreads and people from near and far flock to witness her miracles, a disgraced journalist hoping to revive his career visits the small New England town to investigate. When terrifying events begin to happen all around, he starts to question if these phenomena are the works of the Virgin Mary or something much more sinister.",
      tglRilis: "Mar 03, 2021",
      skor: 7,
      status: "Released",
      gambarPoster: "https://www.themoviedb.org/t/p/w500/bShgiEQoPnWdw4LBrYT5u18JF34.jpg",
      gambarBackdrop: "https://www.themoviedb.org/t/p/original/jw6ASGRT2gi8EjCImpGtbiJ9NQ9.jpg"),
];