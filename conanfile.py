from conans import ConanFile


class CiTesting(ConanFile):
    generators = "cmake_find_package"
    requires = [
        "doctest/2.4.8"
    ]
