from conans import ConanFile


class MyProj(ConanFile):
    generators = "cmake_find_package"
    requires = [
        "doctest/2.4.8"
    ]
