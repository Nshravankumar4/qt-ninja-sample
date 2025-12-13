qt_add_executable(QtNinjaSample
    main.cpp
    MainWindow.cpp
    MainWindow.h
)

target_link_libraries(QtNinjaSample
    Qt6::Widgets
)
