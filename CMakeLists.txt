cmake_minimum_required(VERSION 3.16)

project(QMLDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置macOS SDK路径
if(APPLE)
    set(CMAKE_OSX_SYSROOT "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "10.15" CACHE STRING "Minimum OS X deployment version")
endif()

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)

qt_add_executable(appQMLDemo
    main.cpp
)

set(SOURCES
    Tools.js
)

qt_add_qml_module(appQMLDemo
    URI QMLDemo
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES AppStore.qml

    QML_FILES DiscoverView.qml
    QML_FILES CreateView.qml
    QML_FILES WorkView.qml
    QML_FILES GameView.qml
    QML_FILES DevelopView.qml
    QML_FILES CategoryView.qml
    QML_FILES UpdateView.qml
)

set_target_properties(appQMLDemo PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQMLDemo
    PRIVATE Qt6::Quick
)

install(TARGETS appQMLDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
