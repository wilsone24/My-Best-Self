import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // Lista de tareas predefinidas
    final List<Map<String, String>> tasks = [
      {
        "image": "assets/images/Task.png",
        "nameTask": "Boolean Task",
        "descriptionTask": "Description",
        "page": "/booltaskpage",
      },
      {
        "image": "assets/images/obje.png",
        "nameTask": "Quantifiable Task",
        "descriptionTask": "Description",
        "page": "/quantaskpage",
      },
      {
        "image": "assets/images/water.png",
        "nameTask": "Drink Water",
        "descriptionTask": "Cups",
        "page": "/quantaskpage",
      },
      {
        "image": "assets/images/breakfast.png",
        "nameTask": "Have breakfast",
        "descriptionTask": "Food",
        "page": "/booltaskpage",
      },
      {
        "image": "assets/images/book-stack.png",
        "nameTask": "Read a book",
        "descriptionTask": "Pages",
        "page": "/quantaskpage",
      },
      {
        "image": "assets/images/gym.png",
        "nameTask": "Go to the gym",
        "descriptionTask": "Times",
        "page": "/booltaskpage",
      },
      {
        "image": "assets/images/football.png",
        "nameTask": "Play Soccer",
        "descriptionTask": "Matches",
        "page": "/quantaskpage",
      },
      // Puedes agregar más tareas aquí
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03), // Espacio vertical
              child: Text(
                "Templates",
                style: TextStyle(
                  fontSize: screenHeight * 0.05, // Tamaño de texto grande
                  fontWeight: FontWeight.bold, // Negrita
                ),
              ),
            ),
            Expanded(
              // Para expandir y ocupar el espacio restante
              child: ListView.builder(
                itemCount: tasks.length +
                    1, // Incrementamos el conteo por el padding extra
                itemBuilder: (context, index) {
                  if (index == tasks.length) {
                    return SizedBox(
                        height:
                            screenHeight * 0.05); // Espacio adicional al final
                  }
                  // Obtener los datos de la tarea en la posición actual
                  final task = tasks[index];
                  return PredeterminedTask(
                    screenHeight: screenHeight,
                    nameTask: task['nameTask']!,
                    descriptionTask: task['descriptionTask']!,
                    page: task['page']!,
                    image: task['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PredeterminedTask extends StatelessWidget {
  const PredeterminedTask({
    super.key,
    required this.screenHeight,
    required this.nameTask,
    required this.descriptionTask,
    required this.page,
    required this.image,
  });

  final double screenHeight;
  final String nameTask;
  final String descriptionTask;
  final String page;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: screenHeight * 0.035,
          right: screenHeight * 0.035),
      child: InkWell(
        onTap: () {
          Map<String, String> arguments = {
            "taskName": nameTask,
            "taskDescription": descriptionTask,
            "image": image
          };
          Get.toNamed(page, arguments: arguments);
        },
        borderRadius: BorderRadius.circular(
            15), // Aplica el mismo borde redondeado al efecto de InkWell
        child: Container(
          height: screenHeight * 0.12,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centra verticalmente los elementos del Row
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centra los elementos verticalmente
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Centra horizontalmente en esta columna
                  children: [
                    Image(
                        image: AssetImage(image),
                        height: screenHeight * 0.080,
                        width: screenHeight * 0.080),
                  ],
                ),
              ),
              SizedBox(
                  width: screenHeight *
                      0.022), // Espacio entre la imagen y los textos
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centra los textos verticalmente
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Alinea los textos a la izquierda
                children: [
                  Text(
                    nameTask,
                    style: TextStyle(
                      fontSize: screenHeight * 0.026,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        descriptionTask,
                        style: TextStyle(
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
