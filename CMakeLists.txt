cmake_minimum_required(VERSION 3.14)  # FetchContent nécessite CMake 3.14 ou supérieur
project(mon_projet)

# Inclure FetchContent pour gérer les dépendances externes
include(FetchContent)

# Déclarer la dépendance vers ma_lib
FetchContent_Declare(
    ma_lib
    GIT_REPOSITORY https://github.com/Cyril-Grelier/ma_lib_cpp.git
    GIT_TAG        main  # ou une version spécifique, par exemple : v1.0
)

# Télécharger et intégrer la bibliothèque
FetchContent_MakeAvailable(ma_lib)

# Ajouter l'exécutable principal
add_executable(mon_projet src/main.cpp)

# Lier la bibliothèque à l'exécutable
target_link_libraries(mon_projet PRIVATE ma_lib)
