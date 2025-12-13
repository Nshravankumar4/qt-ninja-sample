set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

qt_add_executable(QtNinjaSample
    main.cpp
    MainWindow.cpp
    MainWindow.h
)

target_link_libraries(QtNinjaSample
    PRIVATE Qt6::Widgets
)
