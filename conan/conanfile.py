from conans import ConanFile


class MyProj(ConanFile):
    generators = "cmake_find_package"
    requires = [
        "gtest/1.11.0"
    ]
