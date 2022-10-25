import 'dart:io';

List<Libro> libros = [];
List<CD> cds = [];
void main() {
  Libro lib = new Libro(
    numeropaginas: 43,
    precio: 12,
    titulo: "titulos",
  );
  libros.add(lib);
  menu();
}

void agregarLibro() {
  stdout.write("Titulo del libro:");
  String? titulo = stdin.readLineSync();
  String titulos = "$titulo";
  stdout.write("Precio del libro:");
  String? precio = stdin.readLineSync();
  int valor = int.parse(precio!);
  stdout.write("Numero de paginas del libro:");
  String? pagina = stdin.readLineSync();
  int paginas = int.parse(pagina!);
  Libro lib = new Libro(
    numeropaginas: paginas,
    precio: valor,
    titulo: titulos,
  );
  libros.add(lib);
}

void agregarCD() {
  stdout.write("Titulo del CD:");
  String? titulo = stdin.readLineSync();
  String titulos = "$titulo";
  stdout.write("Precio del CD:");
  String? precio = stdin.readLineSync();
  int valor = int.parse(precio!);
  stdout.write("Tiempo de Reproduccion:");
  String? pagina = stdin.readLineSync();
  int paginas = int.parse(pagina!);
  CD cd = new CD(
    tiempodereporoduccion: paginas,
    precio: valor,
    titulo: titulos,
  );
  cds.add(cd);
}

void listarlibros() {
  for (int i = 0; i < libros.length; i++) {
    int pocision = i + 1;
    stdout.write("$pocision.");
    libros[i].getAlll();
    stdout.write("\n");
  }
}

void listarcd() {
  for (int i = 0; i < cds.length; i++) {
    int pocision = i + 1;
    stdout.write("$pocision.");
    cds[i].getAlll();
    stdout.write("\n");
  }
}

void menu() {
  stdout.write("Menu Principal\n");
  stdout.write("1.Libros\n");
  stdout.write("2.CD'S\n");
  stdout.write("3.Salir\n");
  stdout.write("Elija una opcion:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      menulibros();
      break;
    case 2:
      menuCD();
      break;
    case 3:
      stdout.write("Nos vemos\n");
      break;
    default:
      stdout.write("Elija una opcion valida\n");
      menu();
  }
}

void menulibros() {
  stdout.write("Menu Libros\n");
  stdout.write("1.Agregar libro\n");
  stdout.write("2.Listar Libros\n");
  stdout.write("3.Regresar\n");
  stdout.write("Elija una opcion:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      agregarLibro();
      menulibros();
      break;
    case 2:
      listarlibros();
      menulibros();
      break;
    case 3:
      stdout.write("Nos vemos\n");
      menu();
      break;
    default:
      stdout.write("Elija una opcion valida\n");
      menu();
  }
}

void menuCD() {
  stdout.write("Menu CD\n");
  stdout.write("1.Agregar CD\n");
  stdout.write("2.Listar CD\n");
  stdout.write("3.Regresar\n");
  stdout.write("Elija una opcion:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      agregarCD();
      menuCD();
      break;
    case 2:
      listarcd();
      menuCD();
      break;
    case 3:
      stdout.write("Nos vemos\n");
      menu();
      break;
    default:
      stdout.write("Elija una opcion valida\n");
      menu();
  }
}

class Publicacion {
  String? titulo;
  int? precio;

  Publicacion(String nombre, int precio) {
    this.titulo = nombre;
    this.precio = precio;
  }
  get getTitulo {
    return this.titulo;
  }

  get getPrecio {
    return this.precio;
  }

  void set setTitulo(String nombre) {
    this.titulo = nombre;
  }

  void set setPrecio(int precio) {
    this.precio = precio;
  }
}

class Libro extends Publicacion {
  int numeropaginas;
  Libro(
      {required String titulo,
      required int precio,
      required this.numeropaginas})
      : super(titulo, precio);

  getAlll() {
    stdout.write("Titulo:" +
        super.getTitulo +
        " Precio:" +
        super.getPrecio.toString() +
        " Numero de Paginas:" +
        this.numeropaginas.toString());
  }
}

class CD extends Publicacion {
  int? tiempodereporoduccion;
  CD(
      {required String titulo,
      required int precio,
      required this.tiempodereporoduccion})
      : super(titulo, precio);
  getAlll() {
    stdout.write("Titulo:" +
        super.getTitulo +
        " Precio:" +
        super.getPrecio.toString() +
        " Tiempo de Repoduccion:" +
        this.tiempodereporoduccion.toString());
  }
}
