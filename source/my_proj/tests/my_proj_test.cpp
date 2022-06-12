/////////////////////////////////////////////////////////////////////
// Copyright (c) 2022 Maciej Patro.
// Distributed under the Boost Software License 1.0
// for more information read LICENSE file.
/////////////////////////////////////////////////////////////////////

#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <my_proj/my_proj.hpp>
#include <doctest/doctest.h>

namespace my_proj {

TEST_CASE("Passing test case")
{
  REQUIRE(tested_function());
}

} // namespace my_proj
