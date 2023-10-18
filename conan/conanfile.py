from conans import ConanFile


class MyProject(ConanFile):
    generators = "cmake_find_package"
    requires = [
        "doctest/2.4.11"
    ]
