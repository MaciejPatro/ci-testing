/////////////////////////////////////////////////////////////////////
// Copyright (c) 2022 Maciej Patro.
// Distributed under the MIT License
// for more information read LICENSE file.
/////////////////////////////////////////////////////////////////////

#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "my_project/my_project.hpp"
#include <doctest/doctest.h>

namespace mp {

TEST_CASE("Passing test case")
{
  REQUIRE(tested_function());
}

} // namespace mp
